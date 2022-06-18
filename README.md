# Pewlett-Hackard-Analysis

## Project Overview
PH is a large company boasting several thousand employees and its been around for a long time. As baby boomers begin to retire at a rapid rate PH is looking toward the future in 2 ways.
1) Its offering retirement package for those satisfying certain criteria
2) Its thinking about which positions need to be filled in the near future with the number of upcoming retirements will create thousands of job openings
Bobby is an up and coming HR analyst whose task is to perform employee research. Specifically he needs to find answers to the following questions. 
1) Who will be retiring next month 
2) How many positions need to be filled. 
This analysis will help future proof PH by generating a list of all employess eligible for retirement package. The employee data Bobby needs is only available in the form of six CSV files because PH has been mainly using Excel and VBA to work with their data. But now they've finally decided to update their methods and instead use SQL, a definite upgrade considering the amount of data. Our task is to help Bobby build an employee database with SQL.

## Resources
- Data Source : departments.csv, employees.csv, dept_emp.csv, dept_manager.csv, titles.csv, salaries.csv
- Software    : pgAdmin 4, Visual studio code, 1.67.2

## Results
We have created 4 csv files as results which include the data related to 
1) The retirement titles that holds all the titles of employees who were born between January 1, 1952 and December 31, 1955.
2) The most recent title of each employee who is retiring
3) The number of employees retiring based on job title
4) The number of employees who are eligible for mentorship program
Below are the results of the analysis 

- The first result set is the retirement_titles where we selected the employees based on the birthdate between 1952 and 1955. We got a huge number of employees that are born within this range who are still working or worked with the company.  There are also multiple records of few employees indicating that the results contain all the titles of the employee he previously workied with along with the current title. Below is the image showing few rows of data.

<img width="250" alt="image" src="https://user-images.githubusercontent.com/104597335/174444334-84ff7bf5-11a4-4412-957b-38d0fff60906.png">



- The second result set is unique_titles which has the data of the employees born between the years 1952 and 1955 with their current title and who are still working with the company. When we included the DISTINCT ON clause in the select query and the conditions we got the latest titles and employees who are still working with the company.
where to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

Below is the image showing few rows of data in this data set.

<img width="208" alt="image" src="https://user-images.githubusercontent.com/104597335/174444394-09b85fa7-3adc-4b3a-ab99-5e2002240f7b.png">


- The third result set is retiring titles where we retrieved the number of employees by their most recent job title who are about to retire. Below is the image of the output. By this we can say that there are more number of employees in the senior roles who are retiring.

Below is the image showing few rows of data in this data set.

<img width="200" alt="image" src="https://user-images.githubusercontent.com/104597335/174444421-7d1a8215-d74e-48a8-8a61-916f6fec3cc2.png">



- The fourth result set is the mentorship_eligibilty that holds the current employees who were born between January 1, 1965 and December 31, 1965 and who are still with the company. The result set contains 1550 employees who are eligible for the retirement package
Below is the image that shows few records of this result set.

<img width="317" alt="image" src="https://user-images.githubusercontent.com/104597335/174444477-f28d743b-7510-4688-bdad-750d9d15bac7.png">


Finally based on all the four result sets we can say that there is a big number who are retiring from the company and majority of them are in senior roles.


## Challenge Summary
- Finally the number of employees who are ready for retirement are and the number of positions to be filled are 72458.

- There are more number of employees in the senior positions as we can see in the below list to monitor the next generation employees.

<img width="129" alt="image" src="https://user-images.githubusercontent.com/104597335/174444263-22ef0c01-5d55-4379-92e0-029191fd1f0a.png">



Below are the queries that provide more insight into the information.
- This query shows the employees retiring by department

select 
	COUNT(ce.emp_no), 
	de.dept_no ,
	d.dept_name
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no
GROUP BY de.dept_no,d.dept_name
ORDER BY de.dept_no;

- This query returns all the retiring employee information thier names, latest title, salary and the department information

SELECT 
    DISTINCT ON (e.emp_no) e.emp_no,
    e.first_name,
    e.last_name,
    e.gender,
    s.salary,
    de.to_date,
    d.dept_name,
    t.title
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
INNER JOIN departments d
ON de.dept_no = d.dept_no
INNER JOIN titles t
ON e.emp_no = t.emp_no
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
     AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no, de.to_date DESC;

