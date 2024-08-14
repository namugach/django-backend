## docker build
docker build -t ml-django-backend .
docker compose build

## 장고 세팅
docker compose run --rm -u root app sh -c "django-admin startproject app . && chown -R django-user /app"

## 어드민 계정 생성
docker compose run --rm -u root app sh -c "python manage.py migrate"
docker compose run --rm -u root app sh -c "python manage.py createsuperuser"
