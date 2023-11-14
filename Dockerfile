FROM golang:1.21
WORKDIR /app

COPY . .

RUN chmod +x /installement.sh
RUN chmod +x /run.sh
RUN go get github.com/lib/pq
RUN go get -u github.com/gin-gonic/gin

RUN go build -o bin .
CMD ["sh", "-c", "./installement.sh;tail -f /dev/null"]
#ENTRYPOINT ["/app/bin"]