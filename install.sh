#!/bin/bash

#######################################################################
# Author: Mickeymgk, <https://t.me/mickeymgk/>
#######################################################################

#            users can now use vivaldi://experiments to change CSS in UI

mod_dir=$HOME/path/to/dir

vivaldi_installs=$(dirname $(find /opt -name "vivaldi-bin" )) ;
vivaldi_install_dirs=( $vivaldi_installs ) ;

echo "---------------------"
count=1
selected=0
echo "Installations found:"
for dir in $vivaldi_installs ; do
	echo $dir": "$count ;
	((count++)) ;
done
read -p "
Select installation to patch.
Input number and press [Enter] or [X] to cancel.
Input selection: " selected ;
if [ "$selected" = "X" ] ; then
	exit ;
fi
((selected--)) ;
if [ $selected -ge ${#vivaldi_install_dirs[@]} ] ; then
    echo "Selection too large!"
fi
dir=${vivaldi_install_dirs[$selected]} ;
echo "---------------------
"
echo "Patch originating from "${mod_dir}" targeting "${vivaldi_install_dirs[$selected]} ;

sudo cp "$dir/resources/vivaldi/window.html" "$dir/resources/vivaldi/window.html-$(date +%Y-%m-%dT%H-%M-%S)"

alreadypatched=$(grep '<script src="mod.js"></script>' $dir/resources/vivaldi/window.html);
#alreadypatched=$(grep '<link rel="stylesheet" href="style/custom.css" />' $dir/resources/vivaldi/window.html);
if [ "$alreadypatched" = "" ] ; then
    echo patching window.html
	#sudo sed -i -e 's/<\/head>/<link rel="stylesheet" href="style\/custom.css" \/> <\/head>/' "$dir/resources/vivaldi/window.html"
    	sudo sed -i -e 's/<\/body>/<script src="mod.js"><\/script> <\/body>/' "$dir/resources/vivaldi/window.html"
else
        echo "window.html has already been patched!"
fi

#if [ -f "$mod_dir/custom.css" ] ; then
#    echo copying custom.css
#    sudo cp -f "$mod_dir/custom.css" "$dir/resources/vivaldi/style/custom.css"
#else
#    echo custom.css missing in $mod_dir
#fi

if [ -f "$mod_dir/mod.js" ] ; then
    echo copying custom.js
    sudo cp -f "$mod_dir/mod.js" "$dir/resources/vivaldi/mod.js"
else
    echo custom.js missing in $mod_dir
fi
