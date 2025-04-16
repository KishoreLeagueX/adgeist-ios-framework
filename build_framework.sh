
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
        SKIP_INSTALL=NO \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        -workspace adgeist-ios-framework.xcworkspace \
        -scheme AdgeistCreatives \
        -configuration Release \
        -destination "generic/platform=iOS" \
        -archivePath build/AdgeistCreatives-iOS.xcarchive

# Create an archive for iOS simulators
xcodebuild \
    archive \
        SKIP_INSTALL=NO \
        BUILD_LIBRARY_FOR_DISTRIBUTION=YES \
        -workspace adgeist-ios-framework.xcworkspace \
        -scheme AdgeistCreatives \
        -configuration Release \
        -destination "generic/platform=iOS Simulator" \
        -archivePath build/AdgeistCreatives-iOS_Simulator.xcarchive

# Convert the archives to .framework
# and package them both into one xcframework
xcodebuild \
    -create-xcframework \
    -archive build/AdgeistCreatives-iOS.xcarchive -framework AdgeistCreatives.framework \
    -archive build/AdgeistCreatives-iOS_Simulator.xcarchive -framework AdgeistCreatives.framework \
    -output output/AdgeistCreatives.xcframework &&\
    rm -rf build
