SELECT * FROM emp;

SELECT
    * FROM emp e;
    
-- �⺻ INNER JOIN �̳�����
SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.deptno --�̰������� �Ʒ��� �������� ����
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
    
    
    
--PL/SQL INNER JOIN �̳�����   
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
    WHERE 1 = 1  -- AND�� ���ֱ� ���� �̷��� ���Ե� �Ѵ� TIP
        AND e.deptno = d.deptno
        AND e.job = 'SALESMAN';


-- LEFT OUTER JOIN ����Ʈ �ƿ��� ����
SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
    FROM emp e
    LEFT OUTER JOIN dept d
    ON e.deptno = d.deptno;

-- RIGHT OUTER JOIN ����Ʈ �ƿ��� ����
SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
    FROM emp e
    RIGHT OUTER JOIN dept d
    ON e.deptno = d.deptno;  -- 40���ڵ�(OPERATIONS)�� ������ �߿� ��� null�� �ߴµ�

-- 
SELECT e.empno
     , e.ename
     , e.job
     , TO_CHAR(e.hiredate,'yyyy-mm-dd') hiredate
     , e.deptno
     , d.dname 
    FROM emp e, dept d
--  WHERE e.deptno = d.deptno (+); -- PL/SQL ������  left outer join    
    WHERE e.deptno (+) = d.deptno; -- PL/SQL ������ right outer join
    
SELECT DISTINCT deptno, dname from dept;
SELECT DISTINCT job, deptno from emp;

-----------------------------------���ǹ�������
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
-- �������ڷ� �������� �����ͻ̱�

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


