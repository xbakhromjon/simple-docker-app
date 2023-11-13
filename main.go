package main

import (
	"database/sql"
	"fmt"
	_ "github.com/lib/pq" // Import the PostgreSQL driver
	"log"
)

const (
	HOST     = "db"
	PORT     = 5432
	USER     = "postgres"
	PASSWORD = "123"
	DBNAME   = "simple_docker_app_db"
)

func main() {
	connString := fmt.Sprintf(
		"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		HOST, PORT, USER, PASSWORD, DBNAME,
	)

	db, _ := sql.Open("postgres", connString)

	defer db.Close()
	err := db.Ping()
	if err != nil {
		log.Fatal(err)
	}
	fmt.Println("Successfully connected db")

	//r := gin.Default()
	//r.GET("/ping", func(c *gin.Context) {
	//	c.JSON(200, gin.H{
	//		"message": "pong",
	//	})
	//})
	//r.Run()
}
