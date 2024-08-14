## build
### docker
```sh
docker build -t ml-django-backend .
```

### docker compose
```sh
docker compose build
```

## 장고
### 프로젝트 생성
```sh
docker compose run --rm -u root app sh -c "django-admin startproject app . && chown -R django-user /app"
```

## 계정 생성
### migrate
```sh
docker compose run --rm -u root app sh -c "python manage.py migrate"
```

### 슈퍼 유저 생성
```sh
docker compose run --rm -u root app sh -c "python manage.py createsuperuser"
```
