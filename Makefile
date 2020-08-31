.PHONY: all bgrt no-bgrt clean install uninstall

all: bgrt

no-bgrt:
	python3 make.py
	cp /usr/share/plymouth/themes/spinner/bullet.png ./unified-bgrt/bullet.png
	cp /usr/share/plymouth/themes/spinner/entry.png ./unified-bgrt/entry.png
	cp /usr/share/plymouth/themes/spinner/lock.png ./unified-bgrt/lock.png
	cp /usr/share/plymouth/themes/spinner/watermark.png ./unified-bgrt/splash.png
	cp /usr/share/plymouth/themes/spinner/watermark.png ./UnifiedSplash/contents/splash/images/splash.png

bgrt:
	python3 make.py
	cp /usr/share/plymouth/themes/spinner/bullet.png ./unified-bgrt/bullet.png
	cp /usr/share/plymouth/themes/spinner/entry.png ./unified-bgrt/entry.png
	cp /usr/share/plymouth/themes/spinner/lock.png ./unified-bgrt/lock.png
	cp /sys/firmware/acpi/bgrt/image ./unified-bgrt/splash.png
	cp /sys/firmware/acpi/bgrt/image ./UnifiedSplash/contents/splash/images/splash.png

clean:
	mv ./unified-bgrt/box.png ./unified-bgrt/box
	rm ./unified-bgrt/*.png
	mv ./unified-bgrt/box ./unified-bgrt/box.png

uninstall:
	rm -rf /usr/share/plymouth/themes/unified-bgrt

install:
	cp -r ./unified-bgrt /usr/share/plymouth/themes/

