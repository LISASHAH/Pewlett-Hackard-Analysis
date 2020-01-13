--Number of [titles] Retiring
SELECT e.emp_no,
	e.first_name,
    e.last_name,
	t.title,
	t.from_date,
	s.salary
INTO emp_title_sal	
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN title as t
ON (t.emp_no = e.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE 
(e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
 -- AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
  AND (de.to_date = '9999-01-01');


--Only the Most Recent Titles
SELECT emp_no, first_name, last_name, from_date, title into emp_recent_titles FROM
  (SELECT emp_no, first_name, last_name, from_date, title,
     ROW_NUMBER() OVER 
(PARTITION BY (first_name, last_name) ORDER BY from_date DESC) rn
   FROM emp_title_sal
  ) tmp WHERE rn = 1
ORDER BY 1;


--Who’s Ready for a Mentor 
SELECT emp_no, first_name, last_name, from_date, to_date, title 
INTO emp_mentors FROM
  (SELECT e.emp_no, first_name, last_name, t.from_date, t.to_date, title,
     ROW_NUMBER() OVER 
(PARTITION BY (first_name, last_name) ORDER BY t.from_date DESC) rn
   FROM employees as e
INNER JOIN title as t
ON (t.emp_no = e.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
WHERE 
(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
  --AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
  AND (de.to_date = '9999-01-01')
  ) tmp WHERE rn = 1
ORDER BY 1;