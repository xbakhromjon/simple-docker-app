FROM golang:1.21
WORKDIR /app
COPY go.mod .
COPY main.go .
#COPY rerunner.sh .

RUN go get github.com/lib/pq
RUN go get -u github.com/gin-gonic/gin
#RUN rerunner.sh

RUN go build -o bin .
CMD ["tail", "-f", "/dev/null"]
#ENTRYPOINT ["/app/bin"]