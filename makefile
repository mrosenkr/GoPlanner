build:
	dbmate dump
	sqlc generate
	go build

run:
	goplanner.exe

