FROM golang:1.9-alpine as build

WORKDIR /app

COPY main.go ./

RUN go build -o main.go .

FROM scratch

COPY --from=build /app /bin

CMD ["./bin/main.go"]