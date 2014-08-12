import os
from settings import *
os.system('export APP_NAME=omop-harvest')
os.system('export DEVELOPMENT_SERVER_HOST=localhost')
os.system('export DEVELOPMENT_SERVER_PORT=8004')
os.system('export PHANTOMJS_PORT=8150')
os.system('export PHANTOMJS_HOST=localhost')
os.system('LOG_FILE=$APP_NAME_phantomjs.log')

os.system('phantomjs --webdriver={0}  2>&1 > {1}/{2}/{3}/{4}/{5} &'.format(PHANTOMJS_GHOSTDRIVER_PORT,os.getcwd(),"headless_tests","test","log","phantomjs.log"))
#os.system('phantomjs --webdriver={0}  2>&1 > {1}/{2}/{3}/{4}/{5}/{6} &'.format(PHANTOMJS_GHOSTDRIVER_PORT,os.getcwd(),os.getcwd(),"headless_tests","test","log","phantomjs.log"))
#os.system('phantomjs --webdriver=PORT 2>&1 > /dev/null &')
