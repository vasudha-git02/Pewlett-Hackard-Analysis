select 
e.emp_no,
e.first_name,
e.last_name,
t.title,
t.from_date,
t.to_date
into retirement_titles
from employees e 
inner join titles t
on e.emp_no = t.emp_no
where e.birth_date between '1952-01-01' AND '1955-12-31'
order by e.emp_no;

select * from retirement_titles;

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

select count(title) ,title
into retiring_titles
from unique_titles
group by title
order by count(title) desc;


-- Deliverable 2

select 
distinct on (e.emp_no) e.emp_no,
e.first_name,
e.last_name,
e.birth_date,
de.from_date,
de.to_date,
t.title
into mentorship_eligibility
from employees e 
inner join dept_emp de
on e.emp_no = de.emp_no
inner join titles t
on e.emp_no = t.emp_no
where de.to_date = '9999-01-01'
and e.birth_date between '1965-01-01' AND '1965-12-31'
order by e.emp_no;