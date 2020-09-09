.PHONY: all main clean install uninstall

all: main

main:
	python3 make.py
	cp ./unified-bgrt/bgrt.script.original ./unified-bgrt/bgrt.script
	cp ./UnifiedSplash/contents/splash/Splash.qml.original ./UnifiedSplash/contents/splash/Splash.qml

	FILE=/sys/firmware/acpi/bgrt/image
	if test -f "$FILE"; then
		cp $FILE ./unified-bgrt/image
		cp $FILE ./UnifiedSplash/contents/splash/images/image.png
		x = $(file < /sys/firmware/acpi/bgrt/xoffset)
		y = $(file < /sys/firmware/acpi/bgrt/yoffset)
		sed -i 's,{image},image,' ./unified-bgrt/bgrt.script
		sed -i 's,{image},images/image.png,' ./UnifiedSplash/contents/splash/Splash.qml
		sed -i 's,{x},$x,' ./unified-bgrt/bgrt.script
		sed -i 's,{y},$y,' ./unified-bgrt/bgrt.script
		sed -i 's,{y},$y,' ./UnifiedSplash/contents/splash/Splash.qml
	else
		sed -i 's,{image},/usr/share/plymouth/themes/spinner/watermark.png,' ./unified-bgrt/bgrt.script
		sed -i 's,{image},/usr/share/plymouth/themes/spinner/watermark.png,' ./UnifiedSplash/contents/splash/Splash.qml
		sed -i 's,{x},width/2 - splash_image.GetWidth()/2,' ./unified-bgrt/bgrt.script
		sed -i 's,{y},height/3,' ./unified-bgrt/bgrt.script
		sed -i 's,{y},height/3,' ./UnifiedSplash/contents/splash/Splash.qml
	fi

clean:
	mv ./unified-bgrt/box.png ./unified-bgrt/box
	rm ./unified-bgrt/*.png
	mv ./unified-bgrt/box ./unified-bgrt/box.png
	rm ./unified-bgrt/bgrt.script
	rm ./UnifiedSplash/contents/splash/Splash.qml

uninstall:
	rm -rf /usr/share/plymouth/themes/unified-bgrt

install:
	cp -r ./unified-bgrt /usr/share/plymouth/themes/
	update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/unified-bgrt/unified-bgrt.plymouth 10
	update-alternatives --set default.plymouth /usr/share/plymouth/themes/unified-bgrt/unified-bgrt.plymouth
	update-initramfs -u -k all
