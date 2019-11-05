FROM golang:1.12 as builder
LABEL maintainer="Stanislav Chesnovsky"
WORKDIR /chesnovskyru
COPY main.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o chesnovskyru .


FROM alpine:3.10
RUN apk --no-cache add ca-certificates
WORKDIR /usr/local/chesnovskyru/
COPY --from=builder /chesnovskyru/chesnovskyru .
COPY static ./static/
COPY index.html ./

EXPOSE 8080
CMD ["./chesnovskyru"]