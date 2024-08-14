## docker build
docker build -t ml-django-backend .
docker compose build


docker compose run --rm -u root app sh -c "django-admin startproject app . && chown -R django-user /app"
