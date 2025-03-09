build:
	dbmate dump
	sqlc generate
	go build -o bin/goplanner.exe ./cmd/app/main.go

run:
	bin/goplanner.exe

