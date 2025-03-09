-- name: GetPerson :one
select * 
from Person
where id = ?
limit 1;

-- name: DeletePerson :exec
Delete from Person
where id = ?;

-- name: CreatePerson :one
Insert Into Person (
    first_name,
    last_name
) values (?, ?)
Returning id;

-- name: UpdatePerson :exec
Update Person
set first_name = ?, last_name = ?
where id = ?;

