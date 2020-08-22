FROM ubuntu
MAINTAINER Yauheni Papovich <ip.popovich@mail.ru>
ARG API_KEY=null
ENV API_KEY_ENV=$API_KEY
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN pip3 install --upgrade pip
RUN cd
RUN ls -a
RUN git clone https://github.com/YauheniPo/py-robot-framework-api-testing.git
RUN cd py-robot-framework-api-testing && \
    ls -a && \
    pip3 install -r requirements.txt

CMD pwd && \
    cd py-robot-framework-api-testing && \
    pabot --processes 4 --pythonpath resources -d results/  -v API_KEY:${API_KEY_ENV} tests/Yauhoo-Finance-*.robot
