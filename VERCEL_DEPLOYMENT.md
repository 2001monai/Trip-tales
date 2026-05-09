# Vercel Deployment Guide for Trip-tales

## Overview
This guide will help you deploy your Trip-tales application to Vercel. The project consists of:
- **Frontend**: React + Vite application
- **Backend**: Express.js API running as Vercel serverless functions

## Prerequisites
1. GitHub account and push your project to a GitHub repository
2. Vercel account (sign up at https://vercel.com)
3. MongoDB instance (MongoDB Atlas recommended)
4. Environment variables ready

## Step-by-Step Deployment

### Step 1: Prepare Your Repository
1. Initialize git if not already done:
   ```bash
   git init
   git add .
   git commit -m "Initial commit"
   ```

2. Push to GitHub:
   ```bash
   git remote add origin https://github.com/YOUR_USERNAME/your-repo-name.git
   git branch -M main
   git push -u origin main
   ```

### Step 2: Set Up Environment Variables

#### 2.1 Create `.env.local` in the root directory:
```env
MONGO_URI=mongodb+srv://username:password@cluster.mongodb.net/triptales?retryWrites=true&w=majority
JWT_SECRET=your_secure_secret_key_here
FRONTEND_URL=https://your-domain.vercel.app
```

#### 2.2 Create `.env.local` in the `frontend` directory:
```env
VITE_API_BASE_URL=https://your-domain.vercel.app/api
```

**Note**: Generate a strong JWT_SECRET. You can use: `node -e "console.log(require('crypto').randomBytes(32).toString('hex'))"`

### Step 3: Deploy to Vercel

#### Option A: Using Vercel CLI (Recommended)

1. Install Vercel CLI:
   ```bash
   npm install -g vercel
   ```

2. Login to Vercel:
   ```bash
   vercel login
   ```

3. Deploy from your project root:
   ```bash
   vercel
   ```

4. Follow the prompts:
   - Confirm project setup
   - Select framework preset: **Other**
   - Root directory: **.** (current directory)

#### Option B: Using Vercel Dashboard

1. Go to https://vercel.com/dashboard
2. Click "Add New..." → "Project"
3. Select your GitHub repository
4. Configure project settings:
   - **Framework Preset**: Vite
   - **Root Directory**: ./frontend
   - **Build Command**: `npm run build`
   - **Output Directory**: `.next` or `dist`

5. Click "Deploy"

### Step 4: Set Environment Variables in Vercel

1. Go to your Vercel project dashboard
2. Navigate to **Settings** → **Environment Variables**
3. Add these variables:
   - `MONGO_URI`: Your MongoDB connection string
   - `JWT_SECRET`: Your JWT secret key
   - `FRONTEND_URL`: Your Vercel domain (e.g., `https://triptales.vercel.app`)

**Important**: Ensure these variables are available for all environments (Production, Preview, Development).

### Step 5: Update CORS Settings

The API CORS is already configured to accept the `FRONTEND_URL` environment variable. No additional changes needed!

### Step 6: Test Your Deployment

1. Visit your deployed URL: `https://your-project-name.vercel.app`
2. Try logging in/signing up
3. Check browser console for any API errors
4. Check Vercel logs for backend errors:
   - Go to **Deployments** → **Function logs**

## Troubleshooting

### "Cannot find module" errors
- **Solution**: Ensure all dependencies are installed. Check `backend/package.json` and `frontend/package.json`

### API calls return 404
- **Solution**: Verify `VITE_API_BASE_URL` is set correctly in frontend environment variables
- Check that the rewrite rules in `vercel.json` are correct

### CORS errors
- **Solution**: Ensure `FRONTEND_URL` is set in Vercel environment variables
- Verify the frontend URL matches exactly in CORS configuration

### MongoDB connection failed
- **Solution**: 
  - Test your `MONGO_URI` locally
  - Add Vercel IPs to MongoDB Atlas IP whitelist (or use `0.0.0.0/0`)
  - Check for typos in connection string

### File uploads not working
- **Solution**: Vercel's serverless functions have temporary storage. For production:
  - Use AWS S3, Cloudinary, or similar service
  - Update `backend/multer.js` to upload to cloud storage

## Production Checklist

- [ ] Environment variables set in Vercel
- [ ] MongoDB connection verified
- [ ] JWT secret set
- [ ] Frontend URL matches deployment URL
- [ ] Test login/signup functionality
- [ ] Test API endpoints
- [ ] Check browser console for errors
- [ ] Verify images/files upload correctly

## Next Steps

1. **Custom Domain** (Optional):
   - Go to Vercel project settings → Domains
   - Add your custom domain
   - Update DNS records as instructed

2. **SSL Certificate**:
   - Vercel automatically provides free SSL/TLS

3. **Performance Monitoring**:
   - Enable Analytics in Vercel dashboard

## Useful Resources
- [Vercel Documentation](https://vercel.com/docs)
- [Vercel Environment Variables](https://vercel.com/docs/concepts/projects/environment-variables)
- [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)

## Questions or Issues?
Check Vercel logs:
```bash
vercel logs --tail
```

For backend debugging:
- Go to Vercel Dashboard → Deployments → Function logs
- Check specific API route logs
