FROM ubuntu
MAINTAINER Yauheni Papovich <ip.popovich@mail.ru>
ARG API_KEY=null
ENV API_KEY_ENV=$API_KEY
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get -y install tzdata && \
    apt-get upgrade -y && \
    apt-get install -y --no-install-recommends apt-utils && \
    apt-get install -y wget \
    git \
    python3 \
    python3-pip

#=========
# Chrome
#=========
#RUN apt-get -y install google-chrome-stable
#RUN apt-get install -f

#=========
# Firefox
#=========
#ARG FIREFOX_VERSION=79.0
#RUN apt-get update -qqy \
#  && apt-get -qqy --no-install-recommends install firefox \
#  && rm -rf /var/lib/apt/lists/* /var/cache/apt/* \
#  && wget --no-verbose -O /tmp/firefox.tar.bz2 https://download-installer.cdn.mozilla.net/pub/firefox/releases/$FIREFOX_VERSION/linux-x86_64/en-US/firefox-$FIREFOX_VERSION.tar.bz2 \
#  && apt-get -y purge firefox \
#  && rm -rf /opt/firefox \
#  && tar -C /opt -xjf /tmp/firefox.tar.bz2 \
#  && rm /tmp/firefox.tar.bz2 \
#  && mv /opt/firefox /opt/firefox-$FIREFOX_VERSION \
#  && ln -fs /opt/firefox-$FIREFOX_VERSION/firefox /usr/bin/firefox

#============
# GeckoDriver
#============
#ARG GECKODRIVER_VERSION=0.27.0
#RUN wget --no-verbose -O /tmp/geckodriver.tar.gz https://github.com/mozilla/geckodriver/releases/download/v$GECKODRIVER_VERSION/geckodriver-v$GECKODRIVER_VERSION-linux64.tar.gz \
#  && rm -rf /opt/geckodriver \
#  && tar -C /opt -zxf /tmp/geckodriver.tar.gz \
#  && rm /tmp/geckodriver.tar.gz \
#  && mv /opt/geckodriver /opt/geckodriver-$GECKODRIVER_VERSION \
#  && chmod 755 /opt/geckodriver-$GECKODRIVER_VERSION \
#  && ln -fs /opt/geckodriver-$GECKODRIVER_VERSION /usr/bin/geckodriver
#
#ENV PATH="usr/bin/geckodriver:${PATH}"

RUN pip3 install --upgrade pip
RUN cd
RUN pwd
RUN ls -a
RUN git clone https://github.com/YauheniPo/py-robot-framework-api-testing.git
RUN cd py-robot-framework-api-testing && \
    ls -a && \
    pip install -r requirements.txt

#============
# ChromeDriver
#============
RUN webdrivermanager --linkpath AUTO chrome

CMD pwd && \
    cd py-robot-framework-api-testing && \
    pabot --processes 10 --pythonpath library -d results/ -v BROWSER:headlesschrome -v API_KEY:${API_KEY_ENV} tests/Yauhoo-Finance-*.robot
