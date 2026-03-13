FROM python:3.12-alpine

ENV PYTHONDONTWRITEBYTECODE=1 \
	PYTHONUNBUFFERED=1 \
	PIP_NO_CACHE_DIR=1 \
	FLASK_APP=app.py \
	FLASK_RUN_HOST=0.0.0.0 \
	FLASK_RUN_PORT=8080

WORKDIR /app

RUN pip install --no-cache-dir Flask \
	&& addgroup -S app \
	&& adduser -S app -G app

COPY app.py ./

USER app

EXPOSE 8080

CMD ["python", "-m", "flask", "run"]
