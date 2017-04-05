FROM jordan/icinga2:latest

RUN buildDeps=" \
    git \
    python-setuptools \
	" \
	&& apt-get update && apt-get install -y jq $buildDeps --no-install-recommends && rm -rf /var/lib/apt/lists/* \
  && git clone https://github.com/hannseman/hipsaint.git /opt/hipsaint \
  && bash -c "cd /opt/hipsaint/ && python setup.py install" \
  && apt-get purge -y --auto-remove -o APT::AutoRemove::RecommendsImportant=false $buildDeps \
  && rm -r /opt/hipsaint/


COPY hipsaint.conf /etc/icinga2.dist/conf.d/
COPY hipchat* /etc/icinga2.dist/scripts/
COPY setup.conf /etc/supervisor/conf.d/
COPY config.sh /opt/setup/

RUN chown nagios /etc/icinga2.dist/scripts/hipchat* \
    && chmod +x /etc/icinga2.dist/scripts/hipchat* \
    && rm /etc/icinga2.dist/conf.d/services.conf
