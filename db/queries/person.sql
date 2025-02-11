-- name: GetPerson :one
select * from Person
where id = ? limit 1;


