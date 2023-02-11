SELECT SUM(duration) AS total_duration FROM assignment_submissions
WHERE student_id = (SELECT id FROM students WHERE name = 'Ibrahim Schimmel');