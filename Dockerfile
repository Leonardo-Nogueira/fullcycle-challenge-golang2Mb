FROM golang:1.17-alpine AS builder

WORKDIR /app

COPY . . 

RUN go build -o /main init.go
#
# MultiStage Building with scratch
#
FROM scratch

WORKDIR /

COPY --from=builder /main /main
EXPOSE 8080

CMD [ "/main" ]