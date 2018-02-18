USE taskdb; 
/* SELECT * FROM task; */
/* SELECT * FROM status; */ 
/* SELECT * FROM user; */

/*  1. Find out how many tasks are in the task table */
SELECT count(*) FROM task;

/* 2. Find out how many tasks in the task table do not have a valid due date */
SELECT count(*) FROM task WHERE due_date IS NULL;

/* 3. Find all the tasks that are marked as done */
SELECT * FROM task LEFT JOIN status ON task.status_id = status.id WHERE name = "Done";

/* 4. Find all the tasks that are not marked as done */
SELECT * FROM task LEFT JOIN status ON task.status_id = status.id WHERE name != "Done";

/* 5. Get all the tasks, sorted with the most recent first */
SELECT * FROM task ORDER BY created DESC; 
/* SELECT * FROM task ORDER BY updated DESC; */
/* SELECT * FROM task ORDER BY due_date DESC; */
/* SELECT * FROM task ORDER BY id DESC ; */

/* 6 .Get the single most recently added task */
SELECT * FROM task ORDER BY created DESC LIMIT 1;
SELECT * FROM task ORDER BY id DESC LIMIT 1;

/* 7. Get the title and due date of all tasks about 'databases' */
SELECT title, due_date FROM task WHERE title LIKE '%databases%';

/* 8. Get the title and status (as a string) of all tasks */
SELECT task.title, status.name FROM task LEFT JOIN status ON task.status_id = status.id;

/* 9. Get the name of each status, along with a count of how many tasks have that status */
SELECT status.name, count(name) FROM task LEFT JOIN status ON task.status_id = status.id GROUP BY status.name;

/* 10. Get the names of all statuses, sorted by most tasks with that status to least */
SELECT status.name, count(name) as tasks FROM task LEFT JOIN status ON task.status_id = status.id GROUP BY status.name ORDER BY tasks DESC;