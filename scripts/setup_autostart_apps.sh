#!/usr/bin/env bash


printf "Setting up symbolic links for desktop apps...\n"

repo="${HOME}/linux_desktop_config"

system_app_dir="/usr/share/applications"
source_dir="${repo}/desktop_apps"
target_dir="${HOME}/.config/autostart"

function link_app_generic() {
    echo "$1/$3 ==> $2/"
    ln -sf $1/$3 $2/
}

function link_app() {
    link_app_generic ${source_dir} ${target_dir} $1
}

apps=$(find ${source_dir} -iname "*.desktop")
for app in ${apps}; do
    link_app ${app##*/}
done

# Standard applications...

standard_apps="\
    firefox \
    terminator \
    viber \
    skypeforlinux "

for app in ${standard_apps}; do
    link_app_generic ${system_app_dir} ${target_dir} "${app}.desktop"
done


echo "All set. Exiting..."

