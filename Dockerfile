FROM python:latest
ADD . /quest-knight

RUN cd quest-knight && \
    pip install -r requirements.txt
