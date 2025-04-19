# scripts/generate_feature.sh

#!/bin/bash

FEATURE_NAME=$1

if [[ -z "$FEATURE_NAME" ]]; then
  echo "❌ Usage: ./scripts/generate_feature.sh <feature-name>"
  exit 1
fi

CAMEL=$(echo "$FEATURE_NAME" | sed -E 's/(^|-)(\w)/\U\2/g')

mkdir -p lib/features/$FEATURE_NAME/views
mkdir -p lib/features/$FEATURE_NAME/widgets

cat <<EOF > lib/features/$FEATURE_NAME/views/${FEATURE_NAME}_screen.dart
import 'package:flutter/material.dart';

class ${CAMEL}Screen extends StatelessWidget {
  const ${CAMEL}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('$CAMEL')),
      body: const Center(child: Text('This is $CAMEL screen')),
    );
  }
}
EOF

echo "✅ Feature '$FEATURE_NAME' created!"
