-- name: GetTimeSlot :one
select * 
from TimeSlot
where id = ?
limit 1;

-- name: DeleteTimeSlot :exec
Delete from TimeSlot
where id = ?;

-- name: CreateTimeSlot :one
Insert Into TimeSlot (
    slot_date,
    start_time,
    end_time
) values (?, ?, ?)
Returning id;

-- name: UpdateTimeSlot :exec
Update TimeSlot
set slot_date = ?, start_time = ?, end_time = ? 
where id = ?;
