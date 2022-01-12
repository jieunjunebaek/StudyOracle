-- Ⱦ������ �����ϴ� SELECTION
SELECT * FROM emp
 WHERE SAL = 5000;
 
SELECT * FROM emp
 WHERE job = 'CLERK';
 
SELECT * FROM emp
 WHERE UPPER(job) = UPPER('CLERK');

SELECT * FROM emp
 WHERE comm = 0 OR comm IS NULL;
 
-- NULL(��)�� ���ǹ��� ��ȣ(=)��� IS NULL�� ����

SELECT * FROM emp
 WHERE comm = 0 AND comm IS NULL;

-- ���� �ΰ� �����
SELECT * FROM emp
 WHERE comm IS NULL AND job = 'ANALYST';
 
-- �������� (�������� "FROM"�� �׻� �����ֱ�!!) 
SELECT empno, ename, deptno
 FROM emp
 WHERE deptno = 30;

-- ���� �ΰ� �̻��� ���̺��� �ϳ��� ���̺�ó�� ��ȸ�ϴ� ��� JOIN
SELECT * FROM emp
 JOIN dept
  ON emp.deptno = dept.deptno;

SELECT e. empno, e. ename, e. job, e. hiredate, e. sal, d. deptno, d. dname
 FROM emp e
 JOIN dept d
  ON e. deptno = d. deptno;


-- DISTINCT �̿��ϱ� (SELECT �߰��� ���������!!)
SELECT DISTINCT job FROM emp ;

-- ��Ī���ϱ� (ALIAS)
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp ;

-- ���ϴ� ������ �����ϱ� ORDER BY / �������� ASC �������� DESC

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
 WHERE sal <> 1000; -- NOT�� WHERE ������ ������� �����, sal NOT 1000 �̶���� ����ȵ�


SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE NOT sal = 1000;
 

SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE sal! = 1000;
 
-- IN (���� �������� �ʴ´ٰ� �ϳ�..)
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

-- LIKE %�� ��ġ�� ���� �˻��ϰ��� �ϴ� ������ ������ �� ����!! (�յڷ� ���̱⵵ ����)
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
 WHERE ename LIKE '__RD'; -- __ED (������ϳ��� �����ϳ�, ���ĺ� 4�� �̸� �� ���ڸ� RD)
 
SELECT ename, job, sal, sal*12 AS annsal
 FROM emp
 WHERE ename LIKE '%RD';

-- NULL ����ϳ� 
-- �Լ��� NVL ���߿� �������ش�.. 
SELECT ename, job, sal, comm
 FROM emp
 WHERE comm IS NULL;

SELECT ename, job, sal, comm
 FROM emp
 WHERE comm IS NOT NULL; --IS NULL �ݴ�� �ϰ� ���� �� "NOT ���"

-- JOIN�� ���η� ���̺� ���̴� �� / UNION�� ���η� ���̺��� �������� ��

SELECT empno, ename, job FROM emp
UNION
SELECT deptno, dname, loc FROM dept;

SELECT empno, ename, job FROM emp
WHERE comm IS NOT NULL
UNION
SELECT deptno, dname, loc FROM dept;

SELECT empno, ename, job FROM emp -- UNION ���� WHERE �߰��ؼ� ���������������!!!
WHERE comm IS NULL
UNION
SELECT deptno, dname, loc FROM dept;


SELECT * FROM emp ;





 
