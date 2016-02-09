FROM ubuntu:14.04
RUN DEBIAN_FRONTEND=noninteractive apt-get update -y \
    && apt-get install -y groff \
            zip \
            unzip \
            apt-transport-https \
            build-essential \
            ca-certificates \
            curl \
            git \
            libssl-dev \
            python \
            rsync \
            software-properties-common \
            wget \
    && apt-get clean \
    && rm -r /var/lib/apt/lists/* \
    && sed -i '1s/^/force_color_prompt=yes\n/' /root/.bashrc


RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
    && unzip awscli-bundle.zip \
    && ./awscli-bundle/install -b /bin/aws

VOLUME ["~/.aws"]

WORKDIR /app

CMD ["aws"]

RUN echo "DONE"