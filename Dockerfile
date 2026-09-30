FROM ubuntu:16.04

MAINTAINER Sara Cawley "saraecawley@gmail.com"

RUN apt-get update -y && \
    apt-get install -y python-pip python-dev

RUN pip install --upgrade "pip<21"
RUN pip install --upgrade "setuptools<45" "wheel<0.38"

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

ENTRYPOINT [ "python" ]

CMD [ "app.py" ]
