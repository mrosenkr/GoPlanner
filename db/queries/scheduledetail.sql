-- name: GetScheduleDetail :one
select * 
from ScheduleDetail
where id = ?
limit 1;

-- name: DeleteScheduleDetail :exec
Delete from ScheduleDetail
where id = ?;

-- name: CreateScheduleDetail :one
Insert Into ScheduleDetail (
    schedule_id,
    schedule_block_id
) values (?, ?)
Returning id;

-- name: UpdateScheduleDetail :exec
Update ScheduleDetail
set schedule_id = ?, schedule_block_id = ?
where id = ?;
