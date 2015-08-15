# Dockerfile extending the generic Python image with application files for a
# single application.
# FROM gcr.io/google_appengine/python-compat
# FROM python:2-onbuild
FROM google/debian:wheezy
# CMD []
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get -q update &&  apt-get install --no-install-recommends -y -q ca-certificates && apt-get -y -q upgrade
RUN apt-get update && apt-get install -y fortunes libespeak-dev && apt-get install -y python && apt-get install -y py$
# RUN rm /var/lib/apt/lists/*_*
# RUN apt-get install -y python-pip
# ADD requirements.txt /app/
ADD . /app/
RUN pip install -r ./app/requirements.txt
WORKDIR ./app/
# CMD ["sudo", "python", "main.py"]
EXPOSE 8080
ENTRYPOINT python main.py
