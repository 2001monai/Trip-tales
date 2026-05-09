#!/bin/bash

# Quick Vercel Deployment Script for Trip-tales

echo "🚀 Preparing Trip-tales for Vercel deployment..."
echo ""

# Check if git is initialized
if [ ! -d .git ]; then
    echo "📦 Initializing git repository..."
    git init
fi

# Check if all environment files exist
if [ ! -f .env.local ]; then
    echo "⚠️  .env.local not found in root!"
    echo "📝 Create .env.local with:"
    echo "   MONGO_URI=your_mongodb_url"
    echo "   JWT_SECRET=your_secret_key"
    echo "   FRONTEND_URL=your_vercel_domain"
    echo ""
fi

if [ ! -f frontend/.env.local ]; then
    echo "⚠️  frontend/.env.local not found!"
    echo "📝 Create frontend/.env.local with:"
    echo "   VITE_API_BASE_URL=https://your-domain.vercel.app/api"
    echo ""
fi

# Check if Vercel CLI is installed
if ! command -v vercel &> /dev/null; then
    echo "📥 Installing Vercel CLI..."
    npm install -g vercel
fi

# Install dependencies
echo "📚 Installing dependencies..."
npm install
cd backend && npm install && cd ..
cd frontend && npm install && cd ..

echo ""
echo "✅ Setup complete!"
echo ""
echo "📋 Deployment steps:"
echo "1. Update .env.local with your MongoDB URL and JWT secret"
echo "2. Update frontend/.env.local with your Vercel domain"
echo "3. Commit your changes: git add . && git commit -m 'Deploy to Vercel'"
echo "4. Push to GitHub: git push origin main"
echo "5. Run: vercel"
echo ""
echo "🌐 For dashboard deployment:"
echo "   - Go to https://vercel.com/dashboard"
echo "   - Click 'Add New Project'"
echo "   - Select your GitHub repository"
echo "   - Add environment variables"
echo "   - Click Deploy"
