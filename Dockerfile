FROM golang:1.24-alpine AS builder
WORKDIR /app
COPY go.mod go.sum ./
RUN go mod download
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -ldflags="-s -w" -o ./gemini-gateway ./cmd/server/

FROM alpine:3.22.0
RUN apk add --no-cache tzdata ca-certificates && mkdir -p /data/gemini-gateway/auths
COPY --from=builder /app/gemini-gateway /app/gemini-gateway
COPY config.yaml /app/config.yaml
WORKDIR /app
EXPOSE 8317 8085
ENV TZ=America/New_York
CMD ["./gemini-gateway"]
