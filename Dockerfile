FROM golang:alpine AS builder

RUN apk update && apk add --no-cache make bash
RUN adduser -D -g '' appuser

WORKDIR /app
COPY . .

RUN make build

FROM scratch

COPY --from=builder /etc/passwd /etc/passwd
COPY --from=builder /app/bin/ga /app/bin/ga
COPY --from=builder /app/static/ /app/static/

USER appuser
EXPOSE 8080

ENTRYPOINT ["/app/bin/ga"]