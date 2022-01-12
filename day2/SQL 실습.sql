-- 횡단위로 조절하는 SELECTION
SELECT * FROM emp
 WHERE SAL = 5000;
 
SELECT * FROM emp
 WHERE job = 'CLERK';
 
SELECT * FROM emp
 WHERE UPPER(job) = UPPER('CLERK');

SELECT * FROM emp
 WHERE comm = 0 OR comm IS NULL;
 
-- NULL(널)의 조건문은 등호(=)대신 IS NULL로 기재

SELECT * FROM emp
 WHERE comm = 0 AND comm IS NULL;

-- 조건 두개 사용함
SELECT * FROM emp
 WHERE comm IS NULL AND job = 'ANALYST';
 
-- 프로젝션 (전제조건 "FROM"을 항상 적어주기!!) 
SELECT empno, ename, deptno
 FROM emp
 WHERE deptno = 30;

-- 조건 두개 이상의 테이블을 하나의 테이블처럼 조회하는 방법 JOIN
SELECT * FROM emp
 JOIN dept
  ON emp.deptno = dept.deptno;

SELECT e. empno, e. ename, e. job, e. hiredate, e. sal, d. deptno, d. dname
 FROM emp e
 JOIN dept d
  ON e. deptno = d. deptno;


-- DISTINCT 이용하기 (SELECT 중간애 적어줘야함!!)
SELECT DISTINCT job FROM emp ;

-- 별칭정하기 (ALIAS)
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp ;

-- 원하는 순서로 정렬하기 ORDER BY / 오름차순 ASC 내림차순 DESC

SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 ORDER BY sal ASC;
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 ORDER BY sal DESC;

SELECT ename, job, sal, sal*12 AS annsal, comm
 FROM emp
 ORDER BY sal DESC;

SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal*12 >= 10000;

SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal <> 1000; -- NOT은 WHERE 다음에 써줘야지 적용됨, sal NOT 1000 이라고쓰면 적용안됨


SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE NOT sal = 1000;
 

SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal! = 1000;
 
-- IN (많이 사용되지는 않는다고 하네..)
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal IN (800, 1600, 5000);
 
 -- BETWEEN A AND B
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal >= 1600 AND sal <= 2975;
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal BETWEEN 1600 AND 2975;

-- LIKE %의 위치에 따라 검색하고자 하는 정보를 선별할 수 있음!! (앞뒤로 붙이기도 가능)
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename = 'JONES';

SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename LIKE 'J%'; 
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename LIKE '%ER';
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename LIKE '%E%'; --'%E%'
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename LIKE '__RD'; -- __ED (언더바하나당 문자하나, 알파벳 4개 이름 중 끝자리 RD)
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename LIKE '%RD';

-- NULL 어떻게하냐 
-- 함수명 NVL 나중에 설명해준대.. 
SELECT ename, job, sal, comm
 FROM emp
 WHERE comm IS NULL;

SELECT ename, job, sal, comm
 FROM emp
 WHERE comm IS NOT NULL; --IS NULL 반대로 하고 싶을 때 "NOT 사용"

-- JOIN은 가로로 테이블 붙이는 것 / UNION은 세로로 테이블이 합쳐지는 것

SELECT empno, ename, job FROM emp
UNION
SELECT deptno, dname, loc FROM dept;

SELECT empno, ename, job FROM emp
WHERE comm IS NOT NULL
UNION
SELECT deptno, dname, loc FROM dept;

SELECT empno, ename, job FROM emp -- UNION 에서 WHERE 추가해서 구문만들수도있음!!!
WHERE comm IS NULL
UNION
SELECT deptno, dname, loc FROM dept;


SELECT * FROM emp ;





 
