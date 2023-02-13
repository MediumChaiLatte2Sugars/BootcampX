SELECT cohorts.name AS name, avg(completed_at - started_at) AS average_assistance_time
FROM assistance_requests x
JOIN students
ON x.student_id = students.id
JOIN cohorts
ON students.cohort_id = cohorts.id
GROUP BY cohorts.name
HAVING avg(completed_at - started_at) >= ALL(
  SELECT avg(completed_at - started_at) 
  FROM assistance_requests y
  JOIN students
  ON y.student_id = students.id
  JOIN cohorts
  ON students.cohort_id = cohorts.id
  GROUP BY cohorts.name
  );
