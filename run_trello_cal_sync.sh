#!/bin/bash
#
# this should work on both Windows and Linux

which python3 > /dev/null 2> /dev/null

if [ $? == 0 ]; then
	python_exe="python3"
	pip_exe="pip3"
else
	python_exe="python"
	pip_exe="pip"
fi

cd ~

needs_install=0
if [ ! -d "./trello-cal-sync-env" ]; then
	echo "Creating virtualenv"
	$python_exe -m venv ./trello-cal-sync-env
	needs_install=1
fi

if [ -d "./trello-cal-sync-env/bin" ]; then
	. ./trello-cal-sync-env/bin/activate
else
	. ./trello-cal-sync-env/Scripts/activate
fi

if [ $needs_install == 1 ]; then
	echo "Installing requirements"
	$pip_exe install -r ./trello-cal-sync/requirements.txt
fi

cd ~/trello-cal-sync

date >> trello_cal_sync.log

$python_exe trello_cal_sync.py >> trello_cal_sync.log 2>> trello_cal_sync.log
