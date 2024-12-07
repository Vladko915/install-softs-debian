#!/bin/bash

user_folder='/home/user' \
&& root_folder="/root" \
&& backup_folder="${user_folder}/__BACKUP_SETTINGS__$(date +%Y-%m-%d_%H-%M)" \
&& backup_folder_zip="${backup_folder}.zip" \
&& mkdir -v --mode=777 $backup_folder \
&& chown user:user $backup_folder \
&& cp -v  --preserve=ownership,mode ${user_folder}/.bashrc $backup_folder/.bashrc \
&& cp -v  --preserve=ownership,mode ${user_folder}/.bash_history $backup_folder/.bash_history \
&& cp -v  --parents --preserve=ownership,mode  ${root_folder}/.bashrc $backup_folder  \
&& cp -v  --parents --preserve=ownership,mode ${root_folder}/.bash_history $backup_folder \
&& cp -rv --parents --preserve=ownership,mode /usr/local/bin $backup_folder \
&& cp -rv --parents --preserve=ownership,mode /home/user/__my_tools__ $backup_folder \
&& cp -rv --parents ${user_folder}/.config/{Code,ibus,autostart,kolourpaintrc,mc,menus,mimeapps.list,Thunar,xfce4} $backup_folder \
&& echo -e "\nZIP archiving started...\n" \
&& zip -r  "${backup_folder_zip}" "${backup_folder}" \
&& echo -e "\nZIP archiving finished...\n" \
&& echo -e "Created: $(du -sh $backup_folder)\n" \
&& echo -e "Created: $(du -sh $backup_folder_zip)\n";
