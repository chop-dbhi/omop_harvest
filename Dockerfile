# Harvest

FROM reslnops01.research.chop.edu:5000/django_baseimage-master:d87766f

MAINTAINER Aaron Browne <brownea@email.chop.edu>

# Install required python packages not provided by django_baseimage
# Harvest components
RUN /opt/ve/bin/pip install "avocado>=2.3.0,<2.4"
RUN /opt/ve/bin/pip install "serrano>=2.3.0,<2.4"
RUN /opt/ve/bin/pip install "modeltree>=1.1.7,<1.2"
RUN /opt/ve/bin/pip install "django-haystack>=2.0,<2.2"
RUN /opt/ve/bin/pip install "python-memcached==1.53"
# Harvest extensions
RUN /opt/ve/bin/pip install "whoosh>=2.6,<2.7"
RUN /opt/ve/bin/pip install "openpyxl"
RUN /opt/ve/bin/pip install "csvkit"
RUN /opt/ve/bin/pip install "git+http://github.research.chop.edu/cbmi/django-chopauth.git#egg=django-chopauth"
# Testing requirements
RUN /opt/ve/bin/pip install "selenium"
RUN /opt/ve/bin/pip install "coveralls"
RUN /opt/ve/bin/pip install "discover"
RUN /opt/ve/bin/pip install "requests"
RUN /opt/ve/bin/pip install "pytz"

# Add Optional Logstash Logging Support
RUN curl https://download.elasticsearch.org/logstash/logstash/logstash-1.4.2.tar.gz -o /tmp/logstash-1.4.2.tar.gz
RUN tar -xzf /tmp/logstash-1.4.2.tar.gz -C /opt/
RUN mv /opt/logstash-1.4.2 /opt/logstash
RUN chmod +x -R /opt/logstash/bin/

# Add the application files
ADD . /opt/app/

# Ensure all python requirements are met
ENV APP_NAME omop_harvest
RUN /opt/ve/bin/pip install -r /opt/app/requirements.txt --use-mirrors

# Add custom application initialization and run scripts that:
#   1. don't try to get project settings from etcd
COPY cid/my_init.d /etc/my_init.d
COPY cid/service /etc/service

EXPOSE 8000
