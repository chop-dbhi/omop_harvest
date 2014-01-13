MANAGE_SCRIPT = ./bin/manage.py
SITE_DIR = ./_site
STATIC_DIR = ./omop_harvest/static
JAVASCRIPT_DIR = ${STATIC_DIR}/scripts/javascript
JAVASCRIPT_SRC_DIR = ${JAVASCRIPT_DIR}/src
JAVASCRIPT_MIN_DIR = ${JAVASCRIPT_DIR}/min

REQUIRE_OPTIMIZE = `which node` ./bin/r.js -o ${JAVASCRIPT_DIR}/app.build.js

all: build collect

setup:
	@if [ ! -f ./omop_harvest/conf/local_settings.py ] && [ -f ./omop_harvest/conf/local_settings.py.sample ]; then \
	    echo 'Creating local_settings.py...'; \
	    cp ./omop_harvest/conf/local_settings.py.sample ./omop_harvest/conf/local_settings.py; \
	fi;

build: optimize

collect:
	@echo 'Symlinking static files...'
	@python ${MANAGE_SCRIPT} collectstatic --link --noinput > /dev/null

optimize: clean
	@if [ ! -f `which node` ]; then \
		echo 'NodeJS must be installed to optimize JavaScript files.'; \
		exit; \
	fi;
	@echo 'Optimizing JavaScript...'
	@mkdir -p ${JAVASCRIPT_MIN_DIR}
	@${REQUIRE_OPTIMIZE} > /dev/null

clean:
	@rm -rf ${JAVASCRIPT_MIN_DIR}


.PHONY: all build optimize
