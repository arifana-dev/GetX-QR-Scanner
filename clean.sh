rm -rf build
flutter clean
cd android
./gradlew clean
cd ..
flutter pub get