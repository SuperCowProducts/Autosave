#!/bin/bash

AUTOSAVE_APP=$1
SLEEP_TIME=$2
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
  if [[ $ACTIVE_APP == *$AUTOSAVE_APP* ]];
  then 
   echo $ACTIVE_APP
   $(sudo keyd do "C-s");
   echo "Autosave successfully"
  else
   echo "Not ${AUTOSAVE_APP}, is ${ACTIVE_APP}"
  fi;
 else
  echo "Screen is blank"
 fi;
 sleep $SLEEP_TIME;
done
