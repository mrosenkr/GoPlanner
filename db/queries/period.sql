-- name: GetPeriod :one
select * 
from Period
where id = ?
limit 1;

-- name: DeletePeriod :exec
Delete from Period
where id = ?;

-- name: CreatePeriod :one
Insert Into Period (
    name,
    start_date,
    end_date
) values (?, ?, ?)
Returning id;

-- name: UpdatePeriod :exec
Update Period
set name = ?, start_date = ?, end_date = ?
where id = ?;

