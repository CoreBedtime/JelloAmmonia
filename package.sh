#!/bin/sh

# Check if the variable $wobblebuildfolder is set and not empty
if [ -z "$wobblebuildfolder" ]; then
    # Check if libglow.dylib exists in the current directory
    if [ -d "./build/" ]; then
        # Set $wobblebuildfolder to the current directory
        wobblebuildfolder=$(pwd)
    else
        # Ask the user to enter the build directory's path
        echo "Please enter the build directory's path:"
        read wobblebuildfolder
    fi
fi

# Create a temporary directory and copy libglow.dylib into it
mkdir $wobblebuildfolder/temp
cp $wobblebuildfolder/build/Debug/JelloInject.bundle/Contents/MacOS/JelloInject $wobblebuildfolder/temp/JelloInject.dylib
cp $wobblebuildfolder/JelloInject.dylib.blacklist $wobblebuildfolder/temp/

# Build the package
# sudo pkgbuild --install-location /usr/local/bin/ammonia/tweaks/ --root $wobblebuildfolder/temp --scripts ./scripts --identifier net.bedtime.glow "$wobblebuildfolder/glow.pkg"
sudo pkgbuild --install-location /usr/local/bin/ammonia/tweaks/ --root $wobblebuildfolder/temp --identifier net.bedtime.wobblywindows "$wobblebuildfolder/wobblywins.pkg"
rm -rf $wobblebuildfolder/scripts/
rm -rf $wobblebuildfolder/temp
