#!/bin/bash

echo "🔧 Setting up Flutter + Firebase template..."

export JAVA_HOME=$(/usr/libexec/java_home -v 17)
export PATH="$JAVA_HOME/bin:$PATH"

echo "📦 Running flutter pub get..."
flutter pub get

echo "✅ Setup complete!"