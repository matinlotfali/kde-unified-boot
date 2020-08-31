Prepare the repository:
    
    sudo apt install python3-aggdraw plymouth-theme-spinner git
    git clone https://github.com/matinlotfali/unified-boot.git    
    cd unified-boot/
    make
    
Install the plymouth and the splash:

    sudo make install
    kpackagetool5 -i "UnifiedSplash"
    
Set the plymouth:    
    
    sudo update-alternatives --set default.plymouth /usr/share/plymouth/themes/unified-bgrt/unified-bgrt.plymouth
    sudo update-initramfs -u -k all	