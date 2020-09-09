# KDE Unified Boot

This project is a combination of a BGRT Plymouth and a Plasma Splash screen
that one shows a progress bar until 50% and the other continues until a smooth transition to the desktop.

![Lenovo Boot](https://j.gifs.com/q7Bv4G.gif)

# Installation
1. Prepare the repository
    
       sudo apt install python3-aggdraw plymouth-theme-spinner git make
       git clone https://github.com/matinlotfali/kde-unified-boot.git    
       cd kde-unified-boot/        
       make
    
2. Install the plymouth and the splash

       sudo make install
       kpackagetool5 -i "UnifiedSplash"    

3. Set the Splash manually. (Is there a command for that?)

    - Go to System Settings
    - Startup and Shutdown
    - Splash Screen
    - Select **Unified Boot Splash**
    - Hit Apply
