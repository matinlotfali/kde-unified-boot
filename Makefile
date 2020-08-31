.PHONY: all bgrt no-bgrt clean install uninstall

x = $(file < /sys/firmware/acpi/bgrt/xoffset)
y = $(file < /sys/firmware/acpi/bgrt/yoffset)

all: bgrt

no-bgrt:
	python3 make.py
	sed -i 's,{image},/usr/share/plymouth/themes/spinner/watermark.png,' ./unified-bgrt/bgrt.script
	sed -i 's,{image},/usr/share/plymouth/themes/spinner/watermark.png,' ./UnifiedSplash/contents/splash/Splash.qml
	sed -i 's,{x},width/2 - splash_image.GetWidth()/2,' ./unified-bgrt/bgrt.script
	sed -i 's,{y},height/3,' ./unified-bgrt/bgrt.script
	sed -i 's,{y},height/3,' ./UnifiedSplash/contents/splash/Splash.qml

bgrt:
	python3 make.py
	cp /sys/firmware/acpi/bgrt/image ./unified-bgrt/image
	cp /sys/firmware/acpi/bgrt/image ./UnifiedSplash/contents/splash/images/image
	sed -i 's,{image},image,' ./unified-bgrt/bgrt.script
	sed -i 's,{image},image,' ./UnifiedSplash/contents/splash/Splash.qml
	sed -i 's,{x},$x,' ./unified-bgrt/bgrt.script
	sed -i 's,{y},$y,' ./unified-bgrt/bgrt.script
	sed -i 's,{y},$y,' ./UnifiedSplash/contents/splash/Splash.qml

clean:
	mv ./unified-bgrt/box.png ./unified-bgrt/box
	rm ./unified-bgrt/*.png
	mv ./unified-bgrt/box ./unified-bgrt/box.png

uninstall:
	rm -rf /usr/share/plymouth/themes/unified-bgrt

install:
	cp -r ./unified-bgrt /usr/share/plymouth/themes/
	update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/unified-bgrt/unified-bgrt.plymouth 10

