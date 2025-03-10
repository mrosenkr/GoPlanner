// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.27.0
// source: scheduleblock.sql

package dbcontext

import (
	"context"
)

const createScheduleBlock = `-- name: CreateScheduleBlock :one
Insert Into ScheduleBlock (
    name,
    days
) values (?, ?)
Returning id
`

type CreateScheduleBlockParams struct {
	Name string
	Days int64
}

func (q *Queries) CreateScheduleBlock(ctx context.Context, arg CreateScheduleBlockParams) (int64, error) {
	row := q.db.QueryRowContext(ctx, createScheduleBlock, arg.Name, arg.Days)
	var id int64
	err := row.Scan(&id)
	return id, err
}

const deleteScheduleBlock = `-- name: DeleteScheduleBlock :exec
Delete from ScheduleBlock
where id = ?
`

func (q *Queries) DeleteScheduleBlock(ctx context.Context, id int64) error {
	_, err := q.db.ExecContext(ctx, deleteScheduleBlock, id)
	return err
}

const getScheduleBlock = `-- name: GetScheduleBlock :one
select id, name, days 
from ScheduleBlock
where id = ?
limit 1
`

func (q *Queries) GetScheduleBlock(ctx context.Context, id int64) (ScheduleBlock, error) {
	row := q.db.QueryRowContext(ctx, getScheduleBlock, id)
	var i ScheduleBlock
	err := row.Scan(&i.ID, &i.Name, &i.Days)
	return i, err
}

const updateScheduleBlock = `-- name: UpdateScheduleBlock :exec
Update ScheduleBlock
set name = ?, days = ?
where id = ?
`

type UpdateScheduleBlockParams struct {
	Name string
	Days int64
	ID   int64
}

func (q *Queries) UpdateScheduleBlock(ctx context.Context, arg UpdateScheduleBlockParams) error {
	_, err := q.db.ExecContext(ctx, updateScheduleBlock, arg.Name, arg.Days, arg.ID)
	return err
}
