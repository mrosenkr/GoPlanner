package main

import (
	"context"
	"database/sql"
	"log"

	_ "github.com/glebarez/go-sqlite"
	"github.com/joho/godotenv"

	"github.com/mrosenrk/goplanner/dbcontext"
)

func main() {
	if err := godotenv.Load(); err != nil {
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
	tran, err := conn.BeginTx(ctx, nil)
	if err != nil {
		return err
	}
	defer tran.Rollback()

	dbTran := db.WithTx(tran)

	person, err := dbTran.GetPerson(ctx, 1)
	if err != nil {
		return err
	}
	log.Println(person)

	log.Println("Done")
	return nil
}
