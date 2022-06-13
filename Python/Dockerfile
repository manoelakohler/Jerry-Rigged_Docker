FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get install -y python3-dev
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-venv

RUN export LANG=C.UTF-8
RUN ln -s /usr/bin/python3 /usr/bin/python

RUN apt-get update
RUN apt-get install ffmpeg libsm6 libxext6  -y

WORKDIR /usr/src/app

COPY requirements.txt ./
# RUN pip install --no-cache-dir -r requirements.txt
RUN pip install -r requirements.txt

RUN apt-get install -y git
RUN python -m pip install 'git+https://github.com/facebookresearch/detectron2.git'

COPY . .

WORKDIR /usr/src/app/VideoAnalysis

EXPOSE 5000
EXPOSE 80
