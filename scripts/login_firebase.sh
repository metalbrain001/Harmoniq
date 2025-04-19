#!/bin/bash

echo "🔐 Firebase CLI Login Script"
echo "---------------------------"

# 1. Check if firebase CLI is installed
if ! command -v firebase &> /dev/null
then
  echo "❌ Firebase CLI not found. Installing it now..."
  curl -sL https://firebase.tools | bash
else
  echo "✅ Firebase CLI is already installed."
fi

# 2. Log in to Firebase
echo "🌐 Logging in to Firebase..."
firebase login --no-localhost

# 3. (Optional) Show available projects
echo ""
echo "📦 Listing your Firebase projects..."
firebase projects:list

# 4. Ask user to set a default project
echo ""
read -p "👉 Enter the Firebase project ID you want to set as default (leave empty to skip): " PROJECT_ID

if [ -n "$PROJECT_ID" ]; then
  firebase use "$PROJECT_ID" --add
  echo "✅ Set '$PROJECT_ID' as your default Firebase project."
else
  echo "⚠️ Skipped setting a default project."
fi

# 5. Show who is logged in
echo ""
firebase login:list

echo ""
echo "✅ Firebase CLI is now authenticated and ready to use."

