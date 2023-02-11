SELECT students.name AS student, SUM(assignment_submissions.duration)/CAST(COUNT(assignment_submissions.*) AS FLOAT) AS average_assignment_duration
FROM students
JOIN assignment_submissions
ON students.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP BY students.name
ORDER BY SUM(assignment_submissions.duration)/COUNT(assignment_submissions.*) DESC;