#!/bin/sh

cd /opt/apps/harvest-app/ && cp headless_tests/settings.py src/conf/local_settings.py
cd /opt/apps/harvest-app/ && python headless_tests/test/start_ghostdriver.py

cd /opt/apps/harvest-app/ && rm -rf headless_tests/test/screen_shots/*
cd /opt/apps/harvest-app/ && rm -rf headless_tests/test/log/*

cd /opt/apps/harvest-app/ && python -m discover -s headless_tests/test --pattern=MyAsthma*.py

cd /opt/apps/harvest-app/ && ps -ef | grep phantomjs | awk '{print $2}' | head -n 1 | xargs kill
