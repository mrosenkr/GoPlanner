-- name: GetSchedule :one
select * 
from Schedule
where id = ?
limit 1;

-- name: DeleteSchedule :exec
Delete from Schedule
where id = ?;

-- name: CreateSchedule :one
Insert Into Schedule (
    name
) values (?)
Returning id;

-- name: UpdateSchedule :exec
Update Schedule
set name = ?
where id = ?;

