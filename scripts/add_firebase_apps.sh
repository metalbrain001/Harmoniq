#!/bin/bash

PROJECT_ID=$1
ANDROID_PACKAGE=${2:-net.metalbrain.harmoniq}
IOS_BUNDLE_ID=${3:-net.metalbrain.harmoniq}

if [[ -z "$PROJECT_ID" ]]; then
  echo "❌ Usage: ./scripts/add_firebase_apps.sh <project-id> [android-package] [ios-bundle-id]"
  exit 1
fi

echo "🎯 Using Firebase Project: $PROJECT_ID"
echo "📱 Registering Android: $ANDROID_PACKAGE"
echo "🍏 Registering iOS: $IOS_BUNDLE_ID"

# ✅ Add Android App
firebase apps:create android "$ANDROID_PACKAGE" --project="$PROJECT_ID" --non-interactive

# ✅ Add iOS App
firebase apps:create ios "$IOS_BUNDLE_ID" --project="$PROJECT_ID" --non-interactive

echo "✅ Firebase apps added to project '$PROJECT_ID'"