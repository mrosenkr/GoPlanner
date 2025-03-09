-- name: GetWeeklySchedule :one
select * 
from WeeklySchedule
where id = ?
limit 1;

-- name: DeleteWeeklySchedule :exec
Delete from WeeklySchedule
where id = ?;

-- name: CreateWeeklySchedule :one
Insert Into WeeklySchedule (
    name,
    period_id,
    schedule_id,
    start_time,
    end_time
) values (?, ?, ?, ?, ?)
Returning id;

-- name: UpdateWeeklySchedule :exec
Update WeeklySchedule
set name = ?, period_id = ?, schedule_id = ?, start_time = ?, end_time = ? 
where id = ?;

