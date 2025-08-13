FROM fukamachi/sbcl

RUN apt-get update && apt-get install -y \
  libpq-dev \
  postgresql-client

RUN ros run -e "(ql-dist:install-dist \"http://dist.shirakumo.org/shirakumo.txt\" :prompt nil)"
RUN ros install qlot

ENV PATH=${PATH}:/root/.roswell/bin:/app/.qlot/bin
ENV CLAILS_CONF_DIR=/app/conf

RUN mkdir /app
WORKDIR /app
COPY . /app

ENTRYPOINT qlot exec clails server --port 5000 -b 0.0.0.0
