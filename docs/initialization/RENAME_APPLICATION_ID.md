## About

Please execute `/scripts/rename-application-id.sh` to automate the process of renaming the application ID in your Flutter project.

This script performs the following steps:

1. Replace Application ID in Configuration JSON Files: Modifies the application ID definition in the configuration JSON files within the flavor directory.
2. Replace Namespace Definition in build.gradle: Updates the namespace definition in the build.gradle file in the app module with the new application ID.
3. Create New MainActivity.kt: Generates a new MainActivity.kt file with the updated package name.
4. Delete Old MainActivity.kt: Removes the old MainActivity.kt file.

## Usage

To use this script, follow these steps:

1. Make sure you have the necessary permissions to execute the script.
2. Provide the new application ID as an argument when running the script.

```bash
$ bash rename-application-id.sh "com.example.new.application.id"
```

Replace "com.example.new.application.id" with the desired new application ID.

## Reference

- [Configure the app module](https://developer.android.com/build/configure-app-module)
- [CFBundleIdentifier](https://developer.apple.com/documentation/bundleresources/information_property_list/cfbundleidentifier)

*Generated with assistance from ChatGPT 3.5*
