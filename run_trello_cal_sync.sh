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

if [ -d "/app" ]; then
	working_dir="/app"
else
	working_dir=$HOME
fi

cd $working_dir

needs_install=0
if [ ! -d "$working_dir/trello-cal-sync-env" ]; then
	echo "Creating virtualenv"
	$python_exe -m venv $working_dir/trello-cal-sync-env
	$python_exe -m pip install --upgrade setuptools
	$python_exe -m pip install --upgrade wheel
	$python_exe -m pip install --upgrade pip
	needs_install=1
fi

if [ -d "$working_dir/trello-cal-sync-env/bin" ]; then
	. $working_dir/trello-cal-sync-env/bin/activate
else
	. $working_dir/trello-cal-sync-env/Scripts/activate
fi

if [ $needs_install == 1 ]; then
	echo "Installing requirements"
	$pip_exe install -r $working_dir/trello-cal-sync/requirements.txt
fi

cd $working_dir/trello-cal-sync

date 

$python_exe trello_cal_sync.py


