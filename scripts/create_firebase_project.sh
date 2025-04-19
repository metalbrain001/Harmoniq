#!/bin/bash

PROJECT_ID=$1
PROJECT_NAME=$2

if [[ -z "$PROJECT_ID" || -z "$PROJECT_NAME" ]]; then
  echo "❌ Usage: ./create_firebase_project.sh <project-id> <display-name>"
  exit 1
fi

echo "📦 Creating Firebase project: $PROJECT_NAME ($PROJECT_ID)..."
firebase projects:create "$PROJECT_ID" --display-name "$PROJECT_NAME"

echo "✅ Project '$PROJECT_NAME' created!"

echo ""
echo "⚠️  To enable Analytics, go to: https://console.firebase.google.com/project/$PROJECT_ID/settings/integrations"