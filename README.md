# harmoniq

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

Project Template.
[]
project-template/
├── android/
│   ├── app/
│   │   ├── build.gradle.kts   ← minSdk, ndkVersion, versions hardcoded or from local.properties
│   ├── gradle.properties      ← JVM config, Java 17, parallel build flags
│   └── local.properties       ← sdk.dir, flutter.sdk, flutter.minSdkVersion
├── ios/                       ← (if you’re targeting iOS)
├── lib/
│   └── main.dart              ← Entry point
├── pubspec.yaml               ← All required dependencies
├── .metadata
├── .idea/                     ← (optional if using Android Studio)
├── .vscode/                   ← launch config, recommended extensions
├── README.md                  ← Setup instructions
└── setup.sh                   ← Auto-installs Flutter, sets JAVA_HOME, configures local.properties

org.gradle.jvmargs=-Xmx6144m -XX:MaxMetaspaceSize=2G -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8
org.gradle.java.home=/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home
android.useAndroidX=true
android.enableJetifier=true
org.gradle.parallel=true
org.gradle.configureondemand=true
