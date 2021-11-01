FROM debian:latest

RUN apt update && apt upgrade -y
RUN apt install git curl python3-pip ffmpeg -y
RUN pip3 install -U npm
RUN cd /
RUN git clone https://github.com/Code-X-Mania/web-url-short
RUN cd web-url-short
WORKDIR /web-url-short
RUN pip3 install -U -r requirements.txt
CMD python manage.py collectstatic --noinput; gunicorn shorty.wsgi --log-file -
