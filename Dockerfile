FROM jcirizar/myubuntu

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python get-pip.py && pip install aws-shell

RUN curl "https://s3.amazonaws.com/aws-cli/awscli-bundle.zip" -o "awscli-bundle.zip" \
    && unzip awscli-bundle.zip \
    && ./awscli-bundle/install -b /bin/aws

VOLUME ["~/.aws"]

WORKDIR /app

CMD ["aws"]

RUN echo "DONE"
