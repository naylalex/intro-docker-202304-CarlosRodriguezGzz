# No requiere Multistage

FROM golang:1.20

COPY dispatcher.go .

RUN go build dispatcher.go

CMD ["./dispatcher"]