FROM python:3.8
MAINTAINER "Bikram" <bikramatmedium@gmail.com>
WORKDIR /app
COPY . /app
RUN pip install -r requirements.txt
EXPOSE 5000
ENTRYPOINT ["python"]
CMD ["app.py"]
