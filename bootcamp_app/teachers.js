const { Pool } = require('pg');

const pool = new Pool({
  user: 'labber',
  password: 'labber',
  host: 'localhost',
  database: 'bootcampx'
});

const args = process.argv.slice(2);
const cohort = args[0];
const limit = args[1];

pool.query(`
SELECT DISTINCT teachers.name AS teacher, cohorts.name AS cohort
FROM assistance_requests
JOIN teachers
ON teacher_id = teachers.id
JOIN students
ON student_id = students.id
JOIN cohorts
ON cohort_id = cohorts.id
WHERE cohorts.name LIKE '${cohort}%'
ORDER BY teacher
LIMIT ${limit || 5};
`)
.then(res => {
  res.rows.forEach(teacher => {
    console.log(`${teacher.cohort}: ${teacher.teacher}`);
  });
})
.catch(err => console.error('query error', err.stack));
