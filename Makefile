.PHONY: all main clean install uninstall

all: main

main:
	python3 make.py

clean:
	mv ./unified-bgrt/box.png ./unified-bgrt/box
	rm -f ./unified-bgrt/*.png
	mv ./unified-bgrt/box ./unified-bgrt/box.png
	rm -f ./UnifiedSplash/contents/splash/images/image.png

uninstall:
	rm -rf /usr/share/plymouth/themes/unified-bgrt
	kpackagetool5 -r "UnifiedSplash"

install:
	kpackagetool5 -i "UnifiedSplash"
	cp -r ./unified-bgrt /usr/share/plymouth/themes/
	update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/unified-bgrt/unified-bgrt.plymouth 10
	update-alternatives --set default.plymouth /usr/share/plymouth/themes/unified-bgrt/unified-bgrt.plymouth
	update-initramfs -u -k all
