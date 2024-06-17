#!/bin/sh
# 
# Rename application ID in project

# [Options] -e: Exit immediately if a command exits with a non-zero status.
set -e

PROJECT_ROOT=$(git rev-parse --show-toplevel)

# [Step0] Check if application ID is provided
if [ "$#" -ne 2 ]; then
    echo "Please provide Android application ID to first argument and iOS bundle ID to second argument."
    echo "Usage: $PROJECT_ROOT/tools/rename-application-id.sh "com.example.android.rename" "com.example.ios.rename""
    exit 1
fi

echo "Starting application ID renaming process..."

readonly NEW_ANDROID_APPLICATION_ID=$1
readonly NEW_IOS_APPLICATION_ID=$2
readonly OLD_ANDROID_APPLICATION_ID="jp.co.yumemi.template"
readonly OLD_IOS_APPLICATION_ID="jp.co.yumemi.template"
readonly OLD_NAMESPACE="jp.co.yumemi.flutter_app"
readonly OLD_PACKAGE_NAME="jp.co.yumemi.flutter_app"

# [Step1] Replace the application ID definition in the configuration JSON files within the flavor directory
echo "[Step1] Replacing the application ID definition in the configuration JSON files within the flavor directory..."

readonly FLAVOR_DIRECTORY_PATH="$PROJECT_ROOT/apps/app/flavor"

for file in "$FLAVOR_DIRECTORY_PATH"/*.json; do
    if [ ! -e "$file" ]; then
        echo "No dart define flavor files found."
        exit 1
    fi

    echo "   Modifying file: $file"

    # [Options] -i extension:
    # Edit files in-place, saving backups with the specified extension. If a zero-length extension is given, no backup will be saved.
    sed -i '' "s/\"appIdAndroid\": \"$OLD_ANDROID_APPLICATION_ID\"/\"appIdAndroid\": \"$NEW_ANDROID_APPLICATION_ID\"/" "$file"
    sed -i '' "s/\"appIdIos\": \"$OLD_IOS_APPLICATION_ID\"/\"appIdIos\": \"$NEW_IOS_APPLICATION_ID\"/" "$file"
done

# [Step2] Replace the namespace definition in build.gradle in the app module with the new application ID.
echo "[Step2] Replacing the namespace definition in build.gradle in app module with new application ID..."

readonly APP_BUILD_GRADLE_PATH="$PROJECT_ROOT/apps/app/android/app/build.gradle"

sed -i '' "s/namespace \"$OLD_NAMESPACE\"/namespace \"$NEW_ANDROID_APPLICATION_ID\"/" "$APP_BUILD_GRADLE_PATH"

# [Step3] Delete old MainActivity.kt
echo "[Step3] Deleting old MainActivity.kt..."
# Backup old MainActivity.kt content and replace the application ID in the content.
readonly MAIN_ACTIVITY_START_PATH="$PROJECT_ROOT/apps/app/android/app/src/main/kotlin"

readonly OLD_MAIN_ACTIVITY_PATH="$MAIN_ACTIVITY_START_PATH/$(echo $OLD_PACKAGE_NAME | tr '.' '/')"
readonly OLD_MAIN_ACTIVITY_CONTENT=$(cat "$OLD_MAIN_ACTIVITY_PATH"/MainActivity.kt)

readonly NEW_MAIN_ACTIVITY_PATH="$MAIN_ACTIVITY_START_PATH/$(echo "$NEW_ANDROID_APPLICATION_ID" | tr '.' '/')"
readonly NEW_MAIN_ACTIVITY_CONTENT=$(printf "%s" "$OLD_MAIN_ACTIVITY_CONTENT" | sed -e "s/package $OLD_NAMESPACE/package $NEW_ANDROID_APPLICATION_ID/")
# [Options]
# -f list: The list specifies fields, separated in the input by the field delimiter character
# -d delim: Use delim as the field delimiter character instead of the tab character.
readonly FIRST_DIRECTORY_PATH=$(echo "$OLD_PACKAGE_NAME" | cut -f 1 -d ".")

rm -r "${MAIN_ACTIVITY_START_PATH:?}/$FIRST_DIRECTORY_PATH"

# [Step4] Create new MainActivity.kt
echo "[Step4] Creating new MainActivity.kt..."

# [Options] -p: Create intermediate directories as required.
mkdir -p "$NEW_MAIN_ACTIVITY_PATH"
echo "$NEW_MAIN_ACTIVITY_CONTENT" > "$NEW_MAIN_ACTIVITY_PATH/MainActivity.kt"

echo "Application ID renaming process completed."
