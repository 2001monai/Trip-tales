# Trip-tales Vercel Deployment Checklist

## ✅ Pre-Deployment Checklist

### Repository Setup
- [ ] Project pushed to GitHub
- [ ] `.gitignore` is properly configured
- [ ] No sensitive data committed

### Environment Variables
- [ ] Created `.env.local` in root directory with:
  - [ ] `MONGO_URI` - MongoDB connection string
  - [ ] `JWT_SECRET` - Secure JWT secret key
  - [ ] `FRONTEND_URL` - Your Vercel domain (e.g., `https://triptales.vercel.app`)
- [ ] Created `frontend/.env.local` with:
  - [ ] `VITE_API_BASE_URL` - API endpoint (e.g., `https://triptales.vercel.app/api`)

### Configuration Files
- [ ] `vercel.json` exists in root
- [ ] `api/index.js` exists with serverless handler
- [ ] `.env.example` exists as documentation

### Dependencies
- [ ] Backend has `serverless-http` in dependencies
- [ ] Frontend has Vite and Tailwind CSS configured
- [ ] All required packages installed locally

### Code Quality
- [ ] No console.log statements with sensitive data
- [ ] CORS configured correctly
- [ ] Database connection string is secure
- [ ] JWT secret is strong (32+ characters)

## 🚀 Deployment Process

### Option 1: Vercel CLI
```bash
vercel
```

### Option 2: GitHub Integration
1. Go to https://vercel.com/dashboard
2. Click "Add New" → "Project"
3. Connect GitHub repository
4. Add environment variables
5. Click "Deploy"

## ⚙️ Post-Deployment Configuration

### In Vercel Dashboard

**Settings → Environment Variables**
- [ ] Add `MONGO_URI`
- [ ] Add `JWT_SECRET`
- [ ] Add `FRONTEND_URL`
- [ ] Ensure all environments are selected (Production, Preview, Development)

**Settings → Build & Development Settings**
- [ ] Output Directory: `frontend/dist`
- [ ] Build Command: `cd frontend && npm run build`
- [ ] Framework Preset: Vite

**Deployments → Function Logs**
- [ ] Check API routes are responding correctly

## 🧪 Testing After Deployment

- [ ] Visit your Vercel domain
- [ ] Test user registration
- [ ] Test user login
- [ ] Test creating a travel story
- [ ] Test image/video uploads (if applicable)
- [ ] Check browser console for errors
- [ ] Verify API calls in Network tab
- [ ] Test on mobile devices

## 🐛 Troubleshooting Commands

```bash
# View deployment logs
vercel logs --tail

# Check environment variables
vercel env ls

# Redeploy
vercel --prod

# List all deployments
vercel list

# Check function execution
vercel list --meta
```

## 📊 Monitoring

- [ ] Enable Analytics in Vercel dashboard
- [ ] Set up error notifications
- [ ] Monitor database connections
- [ ] Check API response times

## 🔗 Important Links

- Vercel Dashboard: https://vercel.com/dashboard
- Project Settings: https://vercel.com/dashboard/[PROJECT_NAME]/settings
- Function Logs: https://vercel.com/dashboard/[PROJECT_NAME]/deployments
- MongoDB Atlas: https://cloud.mongodb.com

## 💡 Common Issues & Solutions

| Issue | Solution |
|-------|----------|
| 404 on API calls | Check `VITE_API_BASE_URL` environment variable |
| CORS errors | Verify `FRONTEND_URL` is set in backend env variables |
| DB connection fails | Check MongoDB Atlas IP whitelist or use `0.0.0.0/0` |
| Slow API response | Check function logs for database query performance |
| File upload fails | Consider using cloud storage (S3, Cloudinary) |
| Env vars not found | Ensure they're added in Vercel dashboard, not just locally |

## 📝 Notes

- Vercel free tier provides sufficient resources for small to medium apps
- Serverless functions have a 10-second timeout by default
- Static files are automatically cached and served via CDN
- Database connection pooling recommended for MongoDB

---

**Deployment Status**: Not started
**Last Updated**: May 9, 2026
