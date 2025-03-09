// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.27.0
// source: person.sql

package dbcontext

import (
	"context"
)

const createPerson = `-- name: CreatePerson :one
Insert Into Person (
    first_name,
    last_name
) values (?, ?)
Returning id
`

type CreatePersonParams struct {
	FirstName string
	LastName  string
}

func (q *Queries) CreatePerson(ctx context.Context, arg CreatePersonParams) (int64, error) {
	row := q.db.QueryRowContext(ctx, createPerson, arg.FirstName, arg.LastName)
	var id int64
	err := row.Scan(&id)
	return id, err
}

const deletePerson = `-- name: DeletePerson :exec
Delete from Person
where id = ?
`

func (q *Queries) DeletePerson(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deletePerson, id)
	return err
}

const getPerson = `-- name: GetPerson :one
select id, first_name, last_name 
from Person
where id = ?
limit 1
`

func (q *Queries) GetPerson(ctx context.Context, id int64) (Person, error) {
	row := q.db.QueryRowContext(ctx, getPerson, id)
	var i Person
	err := row.Scan(&i.ID, &i.FirstName, &i.LastName)
	return i, err
}

const updatePerson = `-- name: UpdatePerson :exec
Update Person
set first_name = ?, last_name = ?
where id = ?
`

type UpdatePersonParams struct {
	FirstName string
	LastName  string
	ID        int64
}

func (q *Queries) UpdatePerson(ctx context.Context, arg UpdatePersonParams) error {
	_, err := q.db.ExecContext(ctx, updatePerson, arg.FirstName, arg.LastName, arg.ID)
	return err
}
