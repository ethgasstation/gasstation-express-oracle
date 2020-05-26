FROM python:3.6-slim-buster as build

COPY requirements.txt .

RUN apt-get update -y \
  && apt-get install -y build-essential \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  &&  pip3 install wheel \
  &&  pip3 install --user -r requirements.txt

FROM python:3.6-slim-buster

ENV USER gasoracle

RUN useradd -r $USER \
  && apt-get update -y \
  && apt-get install -y gosu \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


COPY --from=build --chown=$USER:root /root/.local /home/$USER/.local
COPY gasExpress.py /usr/local/bin/

ENV OUTPUT_DIR /data
VOLUME ["$OUTPUT_DIR"]
WORKDIR "$OUTPUT_DIR"

COPY docker-entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["gasExpress.py"]
