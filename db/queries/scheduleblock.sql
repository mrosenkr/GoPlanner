-- name: GetScheduleBlock :one
select * 
from ScheduleBlock
where id = ?
limit 1;

-- name: DeleteScheduleBlock :exec
Delete from ScheduleBlock
where id = ?;

-- name: CreateScheduleBlock :one
Insert Into ScheduleBlock (
    name,
    days
) values (?, ?)
Returning id;

-- name: UpdateScheduleBlock :exec
Update ScheduleBlock
set name = ?, days = ?
where id = ?;

