VERSION=$1
SHORT_VERSION=`echo $VERSION | tr -d .`

echo "Version: $VERSION"
echo "Short Version: $SHORT_VERSION"
echo "Base Dir: $BASE_DIR"

# Java
echo "Cleaning up Java..."
rm upstream/*.jar
rm -rf upstream/res/*
echo "Copying Java..."
cp opencv/opencv/build/java/opencv-*.jar upstream
cp opencv/build-linux64/modules/java/test/.build/build/jar/opencv-test.jar upstream
cp -r opencv/build-linux64/modules/java/test/.build/res/* upstream/res

# OSX
echo "Cleaning up OSX..."
rm src/main/resources/nu/pattern/opencv/osx/x86_64/*.dylib
echo "Copying OSX..."
cp $BASE_DIR/target/osx/x86_64/lib/libopencv_java*.dylib src/main/resources/nu/pattern/opencv/osx/x86_64

# Linux
echo "Cleaning up Linux x86_32..."
rm src/main/resources/nu/pattern/opencv/linux/x86_32/*.so
echo "Copying Linux x86_32..."
cp opencv/build-linux32/lib/libopencv_java*.so src/main/resources/nu/pattern/opencv/linux/x86_32

echo "Cleaning up Linux x86_64..."
rm src/main/resources/nu/pattern/opencv/linux/x86_64/*.so
echo "Copying Linux x86_64..."
cp opencv/build-linux64/lib/libopencv_java*.so src/main/resources/nu/pattern/opencv/linux/x86_64

# Windows
echo "Cleaning up Windows..."
rm src/main/resources/nu/pattern/opencv/windows/x86_32/*.dll
rm src/main/resources/nu/pattern/opencv/windows/x86_64/*.dll
echo "Copying Windows..."
cp opencv/opencv/build/java/x86/opencv_java*.dll src/main/resources/nu/pattern/opencv/windows/x86_32
cp opencv/opencv/build/java/x64/opencv_java*.dll src/main/resources/nu/pattern/opencv/windows/x86_64
cp opencv/opencv/build/x86/vc12/bin/opencv_ffmpeg* src/main/resources/nu/pattern/opencv/windows/x86_32
cp opencv/opencv/build/x64/vc12/bin/opencv_ffmpeg* src/main/resources/nu/pattern/opencv/windows/x86_64

