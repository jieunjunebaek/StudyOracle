SELECT * FROM emp;

SELECT
    * FROM emp e;
    
-- 기본 INNER JOIN 이너조인
SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.deptno --이걸지워도 아래와 같은값이 나옴
     , d.dname 
    FROM emp e
    INNER JOIN dept d
    ON e.deptno = d.deptno; 
    
SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
    FROM emp e
    INNER JOIN dept d
    ON e.deptno = d.deptno
    WHERE e.job = 'SALESMAN';
    
    
    
--PL/SQL INNER JOIN 이너조인   
SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
    FROM emp e, dept d
    WHERE e.deptno = d.deptno
    AND e.job = 'SALESMAN';


SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
    FROM emp e, dept d
    WHERE 1 = 1  -- AND만 써주기 위해 이렇게 쓰게도 한대 TIP
        AND e.deptno = d.deptno
        AND e.job = 'SALESMAN';


-- LEFT OUTER JOIN 레프트 아우터 조인
SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
    FROM emp e
    LEFT OUTER JOIN dept d
    ON e.deptno = d.deptno;

-- RIGHT OUTER JOIN 라이트 아우터 조인
SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
    FROM emp e
    RIGHT OUTER JOIN dept d
    ON e.deptno = d.deptno;  -- 40번코드(OPERATIONS)는 직원들 중에 없어서 null이 뜨는듯

-- 
SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
    FROM emp e, dept d
--  WHERE e.deptno = d.deptno (+); -- PL/SQL 형식의  left outer join    
    WHERE e.deptno (+) = d.deptno; -- PL/SQL 형식의 right outer join
    
SELECT DISTINCT deptno, dname from dept;
SELECT DISTINCT job, deptno from emp;

-----------------------------------조건문같은거
SELECT * FROM emp
WHERE emp.deptno = 10;


SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
     , e.comm
    FROM emp e
    INNER JOIN dept d
    ON e.deptno = d.deptno;
    
-------------------------------------
-- 세가지자료 기준으로 데이터뽑기

SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
     , e.comm
     , b.ename
     , b.comm   
    FROM emp e, dept d, bonus b
    WHERE e.deptno = d.deptno
    AND e.ename (+) = b.ename; 
    
---------------------------------------------------


