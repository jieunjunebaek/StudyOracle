-- �ּ� (�����Ҷ� �ƹ��� ������ ��ġ�� ����),�Ʒ��� select ������ ����
-- *(asterisk) = all
select*from emp;
-- �빮�� �ҹ��� ���� �Ʒ� ���� (�ణ�� ����)
SELECT*FROM emp;

--�÷��� �����ؼ� select
SELECT ename, job, hiredate 
 FROM emp; 
 
-- �μ��� ��� (DISTINCT)
SELECT DISTINCT deptno
 FROM emp;
  
SELECT DISTINCT empno, deptno
 FROM emp;
  
SELECT DISTINCT job, deptno
 FROM emp;
 
--������ where
SELECT*FROM emp
 WHERE empno = 7499;

SELECT*FROM emp
 WHERE ename = 'ȫ�浿';
 
SELECT*FROM emp
 WHERE job = 'CLERK';

-- �̰� ��ҹ��� �����ϳ� -_-

SELECT*FROM emp
 WHERE job = 'clerk';

-- �޿��� 1500 �̻��λ�� 
SELECT*FROM emp
 WHERE sal>= 1500;
 
 -- �̰� ��ҹ��� �����ϴ� �� ����ã�� (UPPER/LOWER �Ѵ� ������� ��)
SELECT*FROM emp
 WHERE LOWER(job) = LOWER('clerk');
 
 SELECT*FROM emp
 WHERE UPPER(job) = UPPER('clerk');