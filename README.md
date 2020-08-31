**1. Prepare the repository**
    
    sudo apt install python3-aggdraw plymouth-theme-spinner git make
    git clone https://github.com/matinlotfali/unified-boot.git    
    cd unified-boot/
    
    ## On UEFI:
    make    
    ## On BIOS:
    make no-bgrt
    
**2. Install the plymouth and the splash**

    sudo make install
    kpackagetool5 -i "UnifiedSplash"
    
**3. Set the Plymouth**    
        
    sudo update-alternatives --set default.plymouth /usr/share/plymouth/themes/unified-bgrt/unified-bgrt.plymouth
    sudo update-initramfs -u -k all	

**4. Set the Splash**

Go to System Settings -> Startup and Shutdown -> Splash Screen -> Select **Unified Boot Splash** -> Hit Apply