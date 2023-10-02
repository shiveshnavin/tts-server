# Use the base image with Python 3.8.3 on Ubuntu 20.04
FROM brunneis/python:3.8.3-ubuntu-20.04


WORKDIR /app


COPY . .
COPY . .


RUN apt-get update && \
    xargs -a packages.txt apt-get install -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm packages.txt


RUN pip install -r requirements.txt


EXPOSE 7860

CMD ["python","app.py"]
