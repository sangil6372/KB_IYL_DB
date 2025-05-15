USE sqldb;

SELECT *
FROM buytbl
INNER JOIN  usertbl
ON buytbl.userID = usertbl.userID
WHERE buytbl.userID = 'JYP'

SELECT U.userID, U.name, B.prodName, U.addr, CONCAT(U.mobile1, U.mobile2) AS '연락처'
FROM usertbl U
LEFT OUTER JOIN buytbl B
ON U.userID = B.userID
ORDER BY U.userID

SELECT name, CONCAT(mobile1, mobile2) AS '전화번호'
FROM usertbl
WHERE name NOT IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);

SELECT name, CONCAT(mobile1, mobile2) AS '전화번호'
FROM usertbl
WHERE name IN (SELECT name FROM usertbl WHERE mobile1 IS NULL);