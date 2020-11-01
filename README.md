# KDE Unified Boot

This project is a combination of a BGRT Plymouth and a Plasma Splash screen
that one shows a progress bar until 50% and the other continues until a smooth transition to the desktop.

![Lenovo Boot](https://j.gifs.com/q7Bv4G.gif)

# Installation
1. Prepare the repository
           
       git clone https://github.com/matinlotfali/kde-unified-boot.git
       
2. Build images
           
       sudo apt install python3-pip git make
       pip3 install aggdraw
       
       cd kde-unified-boot/        
       make
    
3. Install the plymouth and the splash

       kpackagetool5 -i "UnifiedSplash"
       sudo make install       
