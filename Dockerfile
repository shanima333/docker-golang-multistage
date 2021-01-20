FROM golang:alpine AS BUILDER

RUN mkdir /app

WORKDIR /app

COPY . .

RUN go build -o hello .

FROM alpine

WORKDIR /root

COPY --from=BUILDER /app/hello .

CMD ["./hello"]
