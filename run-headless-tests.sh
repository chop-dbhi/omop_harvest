#!/bin/sh
export APP_ENV=integration_test
export TEST_BASE_URL=$1

if [ "$1" = "" ]
then
	echo "Please provide the server w/ port as an argument (example: 0.0.0.0:8000) where the tests should run\n"
	echo "If you wish to run the tests locally, then please use the localhost 0.0.0.0:8000\n"
	exit 2
fi


echo $TEST_BASE_URL

echo "Started Ghostdriver"
python headless_tests/test/start_ghostdriver.py

rm -rf headless_tests/test/screen_shots/*

echo "Created database"
createdb asmalltestdb

echo "Syncing database"
./bin/manage.py syncdb --noinput --migrate

psql asmalltestdb < headless_tests/data/small_test_db.pgsql

# Start server manually if local host was provided
if [ "$1" = "0.0.0.0:8000" ]
then
	echo "Started Server"
	./bin/manage.py runserver 0.0.0.0:8000 &
fi

echo "Running Test"
python -m discover -s headless_tests/test --pattern=Verify*.py

echo "Shutting Down GhostDriver"
ps -ef | grep phantomjs | awk '{print $2}' | head -n 1 | xargs kill

# Kill the server if it was started manually
if [ "$1" = "0.0.0.0:8000" ]
then
	ps -ef | grep runserver | awk '{print $2}' | head -n 1 | xargs kill
fi

