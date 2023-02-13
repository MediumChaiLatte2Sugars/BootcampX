SELECT a.id, name, day, chapter, COUNT(assistance_requests.*) AS total_requests
FROM assignments AS a
JOIN assistance_requests
ON a.id = assistance_requests.assignment_id
GROUP BY a.id
ORDER BY total_requests DESC;