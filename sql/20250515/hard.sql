USE sqldb;

SELECT S.stdName, S.addr, SC.clubName, C.roomNo
FROM stdtbl S
INNER JOIN stdclubtbl SC
ON S.stdName = SC.stdName
INNER JOIN clubtbl C
ON SC.clubName = C.clubName
ORDER BY S.stdName;

SELECT C.clubName, C.roomNo, S.stdName, S.addr
FROM stdtbl S INNER JOIN stdclubtbl SC
ON S.stdName = SC.stdName
INNER JOIN clubtbl C
ON SC.clubName = C.clubName
ORDER BY C.clubName;

SELECT A.emp AS '부하직원', B.emp AS '직속상관', B.empTel AS '직속상관연락처'
FROM emptbl A INNER JOIN emptbl B
ON A.manager = B.emp
WHERE A.emp = '우대리';

USE employees;

SELECT E.emp_no, E.first_name, E.last_name, T.title
FROM employees E JOIN titles T
ON E.emp_no = T.emp_no
WHERE T.to_date = '9999-01-01';

SELECT e.emp_no,e.first_name,e.last_name,e.gender,e.birth_date,e.hire_date,t.title,s.salary
FROM employees e JOIN titles T ON E.emp_no = T.emp_no AND T.to_date = '9999-01-01'
JOIN salaries s ON e.emp_no = s.emp_no AND s.to_date = '9999-01-01';

SELECT e.emp_no,e.first_name,e.last_name,e.gender,e.birth_date,e.hire_date,t.title,s.salary
FROM employees e JOIN titles T ON E.emp_no = T.emp_no AND T.to_date = '9999-01-01'
JOIN salaries s ON e.emp_no = s.emp_no AND s.to_date = '9999-01-01';
# 현재 재직중인 직원의 정보를 출력하세요.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name AS department
FROM employees E
JOIN dept_emp DE ON E.emp_no = DE.emp_no AND DE.to_date = '9999-01-01'
JOIN departments D ON DE.dept_no = D.dept_no
ORDER BY E.emp_no ASC;
# 부서별 재직중인 직원의 수를 출력하세요.
SELECT D.dept_no, D.dept_name, COUNT(DE.emp_no)
FROM departments D
LEFT JOIN  dept_emp DE ON D.dept_no = DE.dept_no AND DE.to_date = '9999-01-01'
GROUP BY D.dept_no, D.dept_name
ORDER BY D.dept_no ASC
# 직원 번호가 10209인 직원의 부서 이동 히스토리를 출력하세요.
SELECT e.emp_no,e.first_name,e.last_name,d.dept_name,de.from_date,de.to_date
FROM employees e
JOIN dept_emp de ON e.emp_no = de.emp_no
JOIN departments d ON de.dept_no = d.dept_no
WHERE e.emp_no = 10209
ORDER BY de.from_date ASC;
