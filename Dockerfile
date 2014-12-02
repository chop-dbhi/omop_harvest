# OMOP Harvest
FROM phusion/baseimage:0.9.13

MAINTAINER Aaron Browne <brownea@email.chop.edu>

# Install system dependencies
RUN apt-get update -qq --fix-missing
RUN apt-get install -y\
    build-essential\
    git-core\
    libldap2-dev\
    libpq-dev\
    libsasl2-dev\
    libssl-dev\
    libxml2-dev\
    libxslt1-dev\
    libffi-dev\
    openssl\
    python-dev\
    python-setuptools\
    wget\
    zlib1g-dev\
    postgresql-client \
    jq

# Install system-wide python dependencies
RUN easy_install pip
RUN pip install uwsgi\
    virtualenv

# Create python virtual environment for the app
RUN virtualenv --no-site-packages /opt/ve

# Install python dependencies
# Essential packages
RUN /opt/ve/bin/pip install "django>=1.5,<1.6"\
    "south==0.8.4"\
    "uWSGI"\
    "psycopg2==2.5.1"\
    "dj-database-url==0.2.2"\
# Harvest components
    "avocado>=2.3.0,<2.4"\
    "serrano>=2.3.0,<2.4"\
    "modeltree>=1.1.7,<1.2"\
# Harvest extensions
    "django-haystack>=2.0,<2.2"\
    "python-memcached==1.53"\
    "whoosh>=2.6,<2.7"\
    "openpyxl"\
    "csvkit"\
    "django-siteauth==1.0.0"

# Clean up after dependency installation
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Create app directories
RUN mkdir /opt/app /var/log/app /etc/service/app

# Add the application files and initialization and run scripts
ADD . /opt/app/
ADD scripts/01_application_init.sh /etc/my_init.d/01_application_init.sh
ADD scripts/run.sh /etc/service/app/run
RUN chmod +x /etc/my_init.d/01_application_init.sh /etc/service/app/run

# Set environment variables
ENV APP_NAME omop_harvest

# Expose a port for the Harvest web app
EXPOSE 8000

# The default command to kick off the initialization and run scripts
CMD ["/sbin/my_init"]
