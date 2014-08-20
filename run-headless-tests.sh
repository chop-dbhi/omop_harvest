#!/bin/sh
export APP_ENV=integration_test

echo "Started Ghostdriver"
python headless_tests/test/start_ghostdriver.py

rm -rf headless_tests/test/screen_shots/*
rm -rf headless_tests/test/log/*

echo "Created database"
createdb asmalltestdb

echo "C"
./bin/manage.py syncdb --noinput --migrate

psql asmalltestdb < small_test_db.pgsql

echo "Started Server"
./bin/manage.py runserver 0.0.0.0:8000 &

echo "Running Test"
python -m discover -s headless_tests/test --pattern=Verify*.py

echo "Shutting Down GhostDriver"
ps -ef | grep phantomjs | awk '{print $2}' | head -n 1 | xargs kill
