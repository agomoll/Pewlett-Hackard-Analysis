-- Use Dictinct with Orderby to remove duplicate rows
-- SELECT DISTINCT ON (______) _____,
-- ______,
-- ______,
-- ______

-- INTO nameyourtable
-- FROM _______
-- WHERE _______
-- ORDER BY _____, _____ DESC;


SELECT emp_no, 
	first_name,
	last_name
FROM employees;

SELECT title, 
	from_date, 
	to_date
FROM titles


SELECT e.emp_no,
	e.first_name,
	e.last_name,
	t.title, 
	t.from_date, 
	t.to_date
INTO retirement_titles
FROM titles AS t
INNER JOIN employees AS e
ON (t.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT * FROM retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE (to_date = '9999-01-01')
ORDER BY emp_no, title DESC;

DROP TABLE unique_titles;
SELECT * FROM unique_titles;


SELECT COUNT(title) AS count,
	title
INTO retiring_titles
FROM unique_titles
GROUP BY title
ORDER BY "count" DESC;

DROP TABLE retiring_titles;

SELECT * FROM retiring_titles;


-- Deliverable 2
-- Create a mentorship-eligibility table that holds 
-- the current employees who were born between 
-- January 1, 1965 and December 31, 1965.

SELECT DISTINCT ON (e.emp_no)
	e.emp_no, 
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibilty
FROM employees AS e
INNER JOIN dept_emp AS de
ON (e.emp_no = de.emp_no)
INNER JOIN titles AS t
ON (e.emp_no = t.emp_no)
WHERE (de.to_date = '9999-01-01') 
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;


SELECT * FROM mentorship_eligibilty;
SELECT COUNT(*)FROM mentorship_eligibilty;







