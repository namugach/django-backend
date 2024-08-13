# alpine 3.19 버전의 리눅스를 구축하는데, 파이썬 버전은 3.11로 설치된 이미지를 불러옴
# alpine - 경량화된 리눅스 -> 가볍다 -> 빌트가 반복 -> 이미지 자체가 크면 느려짐
FROM python:3.11-alpine3.19

# 이미지 유지 관리자를 seopftware로 지정
LABEL maintainer="seopftware"

# 컨테이너에 찍히는 로그를 볼 수 있도록 허용
ENV PYTHONUNBUFFERED 1

# 컨테이너를 경량화 하기 위해서
# tmp 디렉토리는 나중에 삭제됨
COPY ./requirements.txt /tmp/requirements.txt
COPY ./requirements.dev.txt /tmp/requirements.dev.txt
COPY ./app /app

WORKDIR /app
EXPOSE 8000

ARG DEV=false

RUN python -m venv /py && \
  /py/bin/pip install --upgrade pip && \
  /py/bin/pip install -r /tmp/requirements.txt && \
  rm -rf /tmp && \
  adduser \
    --disabled-password \
    --no-create-home \
    django-user

ENV PATH="/py/bin:$PATH"

USER django-user

