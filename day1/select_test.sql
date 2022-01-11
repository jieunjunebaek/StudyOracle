-- 주석 (실행할때 아무런 영향을 미치지 않음),아래의 select 구문을 실행
-- *(asterisk) = all
select*from emp;
-- 대문자 소문자 구분 아래 참고 (약간의 관행)
SELECT*FROM emp;

--컬럼을 구분해서 select
SELECT ename, job, hiredate 
 FROM emp; 
 
-- 부서명만 출력 (DISTINCT)
SELECT DISTINCT deptno
 FROM emp;
  
SELECT DISTINCT empno, deptno
 FROM emp;
  
SELECT DISTINCT job, deptno
 FROM emp;
 
--조건절 where
SELECT*FROM emp
 WHERE empno = 7499;

SELECT*FROM emp
 WHERE ename = '홍길동';
 
SELECT*FROM emp
 WHERE job = 'CLERK';

-- 이거 대소문자 구분하네 -_-

SELECT*FROM emp
 WHERE job = 'clerk';

-- 급여가 1500 이상인사람 
SELECT*FROM emp
 WHERE sal>= 1500;
 
 -- 이거 대소문자 구분하는 법 구글찾음 (UPPER/LOWER 둘다 상관없는 듯)
SELECT*FROM emp
 WHERE LOWER(job) = LOWER('clerk');
 
 SELECT*FROM emp
 WHERE UPPER(job) = UPPER('clerk');