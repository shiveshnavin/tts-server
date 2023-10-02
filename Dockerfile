FROM python/3.11.5-bookworm

WORKDIR /app

COPY . .

RUN apt-get update && \
    xargs -a packages.txt apt-get install -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    rm packages.txt


RUN pip install -r requirements.txt


EXPOSE 7860

CMD ["python","app.py"]
