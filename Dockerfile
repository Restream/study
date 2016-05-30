FROM ruby:2.3.0

RUN mkdir -p /apps/study
ADD . /apps/study
WORKDIR /apps/study

CMD bash
