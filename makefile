build:
	cd ./app && rm -rf ./build
	cd ./app && west build  -p -b nice_nano_v2 -- -DSHIELD=sofle_left
	cd ./app && adafruit-nrfutil dfu genpkg --dev-type 0x0052 --application ./build/zephyr/zmk.hex ./build/zephyr/dfu_package.zip 
burn:
	cd ./app && adafruit-nrfutil dfu serial --package ./build/zephyr/dfu_package.zip -p /dev/ttyACM0 -b 115200
burn_uf2:
	cd ./app && cp ./build/zephyr/zmk.uf2 /media/shubin/NICENANO
	
	
