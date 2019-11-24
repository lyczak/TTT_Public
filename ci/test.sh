#!/bin/bash
set -ev

echo -e "Download und extract sourcemod"
wget "http://www.sourcemod.net/latest.php?version=$1&os=linux" -O sourcemod.tar.gz
tar -xzf sourcemod.tar.gz

echo -e "Give compiler rights for compile"
chmod +x addons/sourcemod/scripting/spcomp

echo -e "Compile ttt plugins"
for file in addons/sourcemod/scripting/ttt/*.sp
do
  if [ $1 == "1.9" ]; then
    addons/sourcemod/scripting/spcomp -E -w234 -O2 -v2 $file
  else
    addons/sourcemod/scripting/spcomp -w234 -O2 -v2 $file
  fi
done

echo -e "\nCompile 3rd-party-plugins"
echo -e "\nCompiling addons/sourcemod/scripting/block_messages.sp..."
addons/sourcemod/scripting/spcomp -E -w234 -O2 -v2 addons/sourcemod/scripting/block_messages.sp
echo -e "\nCompiling addons/sourcemod/scripting/customkeyvalues.sp..."
addons/sourcemod/scripting/spcomp -E -w234 -O2 -v2 addons/sourcemod/scripting/customkeyvalues.sp
echo -e "\nCompiling addons/sourcemod/scripting/discord_api.sp..."
addons/sourcemod/scripting/spcomp -E -w234 -O2 -v2 addons/sourcemod/scripting/discord_api.sp
echo -e "Compiling addons/sourcemod/scripting/ghostdm.sp..."
addons/sourcemod/scripting/spcomp -E -w234 -O2 -v2 addons/sourcemod/scripting/ghostdm.sp
echo -e "\nCompiling addons/sourcemod/scripting/no_weapon_fix.sp..."
addons/sourcemod/scripting/spcomp -E -w234 -O2 -v2 addons/sourcemod/scripting/no_weapon_fix.sp
echo -e "\nCompiling addons/sourcemod/scripting/tripmines.sp..."
addons/sourcemod/scripting/spcomp -E -w234 -O2 -v2 addons/sourcemod/scripting/tripmines.sp
echo -e "\nCompiling addons/sourcemod/scripting/turret_core.sp..."
addons/sourcemod/scripting/spcomp -E -w234 -O2 -v2 addons/sourcemod/scripting/turret_core.sp
