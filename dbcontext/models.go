// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.27.0

package dbcontext

import (
	"database/sql"
	"time"
)

type Day struct {
	ID        int64
	Dayofweek int64
	Name      string
}

type Period struct {
	ID        int64
	Name      sql.NullString
	StartDate time.Time
	EndDate   time.Time
}

type Person struct {
	ID        int64
	FirstName string
	LastName  string
}

type Schedule struct {
	ID   int64
	Name sql.NullString
}

type ScheduleBlock struct {
	ID   int64
	Name string
	Days int64
}

type ScheduleDetail struct {
	ID              int64
	ScheduleID      int64
	ScheduleBlockID int64
}

type SchemaMigrations struct {
	Version string
}

type TimeSlot struct {
	ID        int64
	SlotDate  time.Time
	StartTime time.Time
	EndTime   time.Time
}

type WeeklySchedule struct {
	ID         int64
	Name       sql.NullString
	PeriodID   int64
	ScheduleID int64
	StartTime  time.Time
	EndTime    time.Time
}
