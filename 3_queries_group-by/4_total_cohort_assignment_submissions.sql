SELECT cohorts.name AS cohort, count(assignment_submissions.*) AS total_submissions
FROM students
JOIN cohorts
ON cohorts.id = cohort_id
JOIN assignment_submissions
ON assignment_submissions.student_id = students.id
GROUP BY cohorts.name
ORDER BY count(assignment_submissions.*) DESC;