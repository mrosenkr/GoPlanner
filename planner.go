package main

import (
	"context"
	"database/sql"
	"log"

	_ "github.com/glebarez/go-sqlite"

	"github.com/mrosenrk/goplanner/dbcontext"
)

func main() {
	if err := run(); err != nil {
		log.Fatal(err)
	}
}

func run() error {
	ctx := context.Background()

	conn, err := sql.Open("sqlite", "db/goplanner.sqlite3")
	if err != nil {
		return err
	}
	defer conn.Close()

	db := dbcontext.New(conn)

	person, err := db.GetPerson(ctx, 1)
	if err != nil {
		return err
	}
	log.Println(person)

	log.Println("Done")
	return nil
}
