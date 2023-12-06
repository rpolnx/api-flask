FROM python:3.11.4-slim-bullseye AS builder

WORKDIR /usr/app

COPY ./requirements.txt .

RUN pip3 install wheel
# RUN pip3 install -r requirements.txt
RUN pip3 wheel -r requirements.txt --wheel-dir=./deps

FROM python:3.11.4-slim-bullseye AS final

WORKDIR /usr/app

COPY ./requirements.txt .
COPY ./src ./src
COPY --from=builder /usr/app/deps ./deps

RUN pip3 install --no-index --find-links=./deps -r requirements.txt

ENTRYPOINT ["python3"]

CMD ["src/app.py"]
