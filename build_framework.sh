
# A shell script for creating an XCFramework for iOS.

# Starting from a clean slate
# Removing the build and output folders
rm -rf ./build &&\
rm -rf ./output &&\

# Cleaning the workspace cache
xcodebuild \
    clean \
    -workspace adgeist-ios-framework.xcworkspace \
    -scheme AdgeistCreatives

# Create an archive for iOS devices
xcodebuild \
    archive \
        ONLY_ACTIVE_ARCH=NO \
        SKIP_INSTALL=NO \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        -workspace adgeist-ios-framework.xcworkspace \
        -scheme AdgeistCreatives \
        -configuration Release \
        -destination "generic/platform=iOS" \
        -archivePath build/AdgeistCreatives-iOS.xcarchive \
         -sdk iphoneos

# Create an archive for iOS simulators
xcodebuild \
    archive \
        ONLY_ACTIVE_ARCH=NO \
        SKIP_INSTALL=NO \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        -workspace adgeist-ios-framework.xcworkspace \
        -scheme AdgeistCreatives \
        -configuration Release \
        -destination "generic/platform=iOS Simulator" \
        -archivePath build/AdgeistCreatives-iOS_Simulator.xcarchive \
        -sdk iphonesimulator

# Convert the archives to .framework
# and package them both into one xcframework
xcodebuild \
    -create-xcframework \
    -framework build/AdgeistCreatives-iOS.xcarchive/Products/Library/Frameworks/AdgeistCreatives.framework \
    -framework build/AdgeistCreatives-iOS_Simulator.xcarchive/Products/Library/Frameworks/AdgeistCreatives.framework \
    -output output/AdgeistCreatives.xcframework &&\
    rm -rf build
