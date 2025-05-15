use sqldb;

SELECT userID AS '사용자 아이디', SUM(amount) AS '총 구매 개수'
FROM buytbl
GROUP BY userID;

SELECT AVG(amount) AS '평균 구매 개수'
FROM buytbl;

SELECT userID, AVG(amount) AS '평균 구매 개수'
FROM buytbl
GROUP BY userID;

SELECT name, height
FROM usertbl
WHERE height = (SELECT MAX(height) FROM usertbl)
   OR height = (SELECT MIN(height) FROM usertbl);

SELECT COUNT(mobile1) AS '휴대폰이 있는 사용자'
FROM usertbl;

SELECT userID AS' 사용자', SUM(price*amount) AS '총구매액'
FROM buytbl
GROUP BY userID;

SELECT userID AS' 사용자', SUM(price*amount) AS '총구매액'
FROM buytbl
GROUP BY userID
HAVING SUM(price*amount) > 1000;

USE world;

-- 1. 국가코드가 'KOR'인 도시들의 인구수 총합
SELECT SUM(Population) AS '총인구수'
FROM city
WHERE CountryCode = 'KOR';

-- 2. 국가코드가 'KOR'인 도시들의 인구수 중 최소값 (필드명: 최소값)
SELECT MIN(Population) AS '최소값'
FROM city
WHERE CountryCode = 'KOR';

-- 3. 국가코드가 'KOR'인 도시들의 인구수 평균
SELECT AVG(Population) AS '평균인구수'
FROM city
WHERE CountryCode = 'KOR';

-- 4. 국가코드가 'KOR'인 도시들의 인구수 중 최대값 (필드명: 최대값)
SELECT MAX(Population) AS '최대값'
FROM city
WHERE CountryCode = 'KOR';

-- 5. country 테이블 각 레코드의 Name 칼럼의 글자수
SELECT Name, LENGTH(Name) AS '글자수'
FROM country;

-- 6. country 테이블의 나라명 앞 세글자만 대문자로
SELECT UPPER(SUBSTRING(Name, 1, 3)) AS '앞세글자'
FROM country;

-- 7. country 테이블의 기대수명을 소수점 첫째자리에서 반올림
SELECT ROUND(LifeExpectancy, 1) AS '기대수명'
FROM country;

USE employees;
-- 각 부서별 관리자를 출력
SELECT d.dept_name AS '부서명', e.first_name AS '관리자_이름', e.last_name AS '관리자_성'
FROM departments d
         JOIN dept_manager dm ON d.dept_no = dm.dept_no
         JOIN employees e ON dm.emp_no = e.emp_no;

-- 8번 페이지의 데이터 출력 (페이지 당 20명, 입사일 내림차순 정렬)
SELECT emp_no, first_name, last_name, hire_date
FROM employees
ORDER BY hire_date DESC
LIMIT 20 OFFSET 140;

-- 재직자의 총 수를 구하기 (to_date가 '9999-01-01'인 경우)
SELECT COUNT(*) AS '재직자수'
FROM employees e
         JOIN dept_emp de ON e.emp_no = de.emp_no
WHERE de.to_date = '9999-01-01';

SELECT ROUND(AVG(salary)) AS '평균 급여'
FROM salaries
WHERE to_date = '9999-01-01';


-- 재직자 전체 평균 급여보다 급여를 더 많이 받는 재직자 출력
SELECT e.emp_no, e.first_name, e.last_name, s.salary
FROM employees e
         JOIN salaries s ON e.emp_no = s.emp_no
WHERE s.to_date = '9999-01-01'
  AND s.salary > (SELECT AVG(salary) FROM salaries WHERE to_date = '9999-01-01');

-- 각 부서별 재직자 수 출력 (부서 번호 오름차순 정렬)
SELECT de.dept_no, COUNT(de.emp_no) AS '재직자수'
FROM dept_emp de
WHERE de.to_date = '9999-01-01'
GROUP BY de.dept_no
ORDER BY de.dept_no ASC;

