#!/bin/bash
launchctl unload  ~/Library/LaunchAgents/com.koekeishiya.chunkwm.plist;
BASE_DIR=$(pwd);
CUSTOM_CONFIG_DIR="custom_config"
function installcwm {
	rm -rf bin/
	make install
	cp bin/chunkwm /usr/local/bin
	cp $CUSTOM_CONFIG_DIR/chunkwmrc ~/.chunkwmrc
	cp examples/com.koekeishiya.chunkwm.plist ~/Library/LaunchAgents
}
function installchunc {
	cd src/chunkc
        make
        cp bin/chunkc /usr/local/bin
}
function installplugins {
	cd src/plugins;
	for d in */ 
	do
	    (cd "$d" && ls -al && make install && mkdir -p ~/.chunkwm_plugins && cp ../../../plugins/* ~/.chunkwm_plugins)
	done
}
cd $BASE_DIR;
installcwm;
cd $BASE_DIR
installchunc;
cd $BASE_DIR;
installplugins

ln -f -s $BASE_DIR/$CUSTOM_CONFIG_DIR/chunkwmrc ~/.chunkwmrc
launchctl load -F -w ~/Library/LaunchAgents/com.koekeishiya.chunkwm.plist;

