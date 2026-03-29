#!/bin/bash
# echo "(${@:1:$#-1})"
AUTOSAVE_APPS=(${@:1:$#-1})
# AUTOSAVE_APP=$1


SLEEP_TIME=${@: -1}

while true
do
# https://stackoverflow.com/questions/63562111/how-can-i-determine-if-my-kde-desktop-is-in-lock-screen-state-from-command-line
# is `kdotool` universal?
ACTIVE_APP=$(kdotool getwindowclassname $(kdotool getactivewindow));
SCREEN_INFO=$(dbus-send --session --dest=org.freedesktop.ScreenSaver --type=method_call --print-reply /org/freedesktop/ScreenSaver org.freedesktop.ScreenSaver.GetActive
);
TIME=$(date +"%d-%m-%y %T");
echo -n "${TIME} "
if [[ $SCREEN_INFO == *"boolean false"* ]];
then
for i in $AUTOSAVE_APPS; do
if [[ " ${AUTOSAVE_APPS[*]} " =~ [[:space:]]"$ACTIVE_APP"[[:space:]] ]]; then
echo $ACTIVE_APP
$(keyd do "C-s");
echo "Autosave successfully"
else
# echo "About to output array items in order: "
# echo ${AUTOSAVE_APPS[0]}
# echo ${AUTOSAVE_APPS[1]}
# echo ${AUTOSAVE_APPS[2]}

# https://stackoverflow.com/questions/9057387/process-all-arguments-except-the-first-one-in-a-bash-script
# https://stackoverflow.com/questions/65957633/check-if-array-is-empty-in-bash

printf "Not "
printf %s "${AUTOSAVE_APPS[0]}"
# if [ -n ${AUTOSAVE_APPS[1]} ]; then
if [ ${#AUTOSAVE_APPS[@]} -gt 1 ]; then
printf ' or %s' "${AUTOSAVE_APPS[@]:1}"
fi
printf ", is ${ACTIVE_APP}\n"
fi;
done
else
echo "Screen is blank"
fi;
sleep $SLEEP_TIME;
done
