FROM livebook/livebook

RUN apt upgrade -y \
  && apt update \
  && apt install --no-install-recommends -y \
  gnupg2 \
  apt-transport-https \
  libopencv-dev \
  build-essential \
  erlang-dev \
  software-properties-common \
  sudo \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN apt update \
  && apt install --no-install-recommends -y \
  python3.9 \
  python3-pip \
  && apt clean \
  && rm -rf /var/lib/apt/lists/* \
  && update-alternatives --install /usr/bin/python python /usr/bin/python3.9 10 \
  && update-alternatives --install /usr/bin/pip pip /usr/bin/pip3 10

RUN pip install --upgrade pip \
  && pip install jupyterlab torch torchvision

ENV HOME=/home/livebook
ENV EVISION_PREFER_PRECOMPILED=true

WORKDIR /home/livebook

RUN mix local.hex --force \
  && mix local.rebar --force

COPY ./run_servers.sh /root/run_servers.sh

RUN chmod +x /root/run_servers.sh

COPY ./notebooks /home/livebook/notebooks

CMD ["/root/run_servers.sh"]
