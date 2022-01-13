
-- Oracle �Լ�
-- ���ڿ� �Լ�

-- �빮��
SELECT * FROM emp
 WHERE job = UPPER('analyst');
 
SELECT UPPER('analyst') FROM dual;

-- �ҹ���
SELECT LOWER(ename) AS emane, LOWER(job) job FROM emp -- ù�� �̸� �ٲ�����!! AS �ᵵ �ǰ� �Ƚᵵ ����ǳ�:)
 WHERE comm IS NOT NULL;

-- �������� �ٹٲ��س����� 
SELECT LOWER(ename) AS emane, 
       LOWER(job) job 
 FROM emp -- ù�� �̸� �ٲ�����!! AS �ᵵ �ǰ� �Ƚᵵ ����ǳ�:)
 WHERE comm IS NOT NULL;

SELECT LOWER(ename) AS emane, 
       INITCAP(job) job -- INITCAP �Ǿձ��ڸ� �빮�ڷ� ǥ�� 
 FROM emp 
 WHERE comm IS NOT NULL;


-- LENGTH ���ڱ���
SELECT ename, LENGTH(ename) ���ڼ�, LENGTHB(ename) ����Ʈ�� -- LENTHB ���� ����Ʈ��
 FROM emp;
  
SELECT LENGTHB('ȫ�浿') FROM dual;

SELECT * FROM emp;

SELECT ename, LENGTH(ename)
 FROM emp;
 
SELECT LENGTHB('ȫ�浿') FROM dual; 

-- SUBSTRING ���ϴµ��� ���� �ڸ���
SELECT '�ȳ��ϼ���. �Ѱ��� IT�����п� �����͹��Դϴ�.' phase FROM dual;
SELECT SUBSTR('�ȳ��ϼ���. �Ѱ��� IT�����п� �����͹��Դϴ�.',18) phase FROM dual; --18��°���� '�����͹��Դϴ�' ����
SELECT SUBSTR('�ȳ��ϼ���. �Ѱ��� IT�����п� �����͹��Դϴ�.',18,5) phase FROM dual; --18��°���� �ټ����� '������' ����

SELECT INSTR('�ȳ��ϼ���. �Ѱ��� IT�����п� �����͹��Դϴٿ�.','��',6) phase FROM dual;


SELECT REPLACE('�ȳ��ϼ���. �Ѱ��� IT�����п� �����͹��Դϴ�.','�ȳ��ϼ���','����������') phase 
  FROM dual;

-- ������ġ��
SELECT 'A' || 'B' FROM dual;
SELECT CONCAT('A','B') FROM dual;


-- TRIM
SELECT '     �ȳ��ϼ���     ' FROM dual;
SELECT LTRIM('     �ȳ��ϼ���     ') FROM dual;
SELECT RTRIM('     �ȳ��ϼ���     ') FROM dual;
SELECT TRIM('     �ȳ��ϼ���     ') FROM dual;


-- ROUND �ݿø� TRUNC ����
SELECT ROUND(15.193,1) FROM dual; --15.2
SELECT ROUND(15.193) FROM dual; --15

SELECT TRUNC(15.193) FROM dual;


-- SYSDATE ���� ��¥�� �ð�
SELECT SYSDATE FROM dual;


-- TO_CHAR : ���� �Ǵ� ��¥ �����͸� ���� �����ͷ�
SELECT ename, TO_CHAR(hiredate,'yyyy-mm-dd'), TO_CHAR(sal+100) || '$' FROM emp;

SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd') -- ���ۺ��� ������ ����
      ,TO_CHAR(SYSDATE, 'yyyy-mm-dd')
      ,TO_CHAR(SYSDATE, '""yyyy"�� "mm"�� "dd"��"')
 FROM dual;
 
 


-- TO_NUMBER
SELECT TO_NUMBER ('2400') + 100 FROM dual;
SELECT TO_NUMBER('100,000','999,999') FROM dual; -- ���ۺ��� �����Ѱ�


-- TO_DATE : ���� �����͸� ��¥ �����ͷ�
SELECT TO_DATE('2022-01-12') FROM dual;
SELECT TO_DATE('01/12/22', 'mm/dd/yy') FROM dual;
SELECT TO_DATE('01/12/22') FROM dual;


--NVL : NULL�� �ƴϸ� �״��, NULL�̸� ������ ��

SELECT ename, job, sal, sal*12 AS annsal, NVL(comm,0) comm
 FROM emp
 ORDER BY sal DESC;
 
SELECT ename, job, sal*12, NVL(comm,0) comm, (sal*12) + NVL(comm,0) AS �ѿ��� 
 FROM emp
 ORDER BY sal DESC;
 

--�����Լ�
 -- SUM : �հ�
SELECT sal, NVL(comm, 0) FROM emp;
SELECT SUM(sal) totalsalary FROM emp; --25925
SELECT SUM(NVL(comm,0)) totalcommision FROM emp; --2200
SELECT SUM(comm) totalcommision FROM emp; -- 2200 SUM �Լ��� ������༭ NULL �Ű�Ƚᵵ �ȴٴµ�..?

    
 -- COUNT : ������ ����
 -- MAX : �ִ� / MIN : �ּڰ� / AVG : ��հ�

SELECT MAX(sal)||'$' FROM emp; -- 5000
SELECT MIN(sal) FROM emp;
SELECT AVG(sal) FROM emp;
SELECT ROUND(AVG(sal),0) sal_avg FROM emp;

-- ��� ���� ���ϴ� ���� ���� ����ϴ� GROUP BY ��
SELECT MAX(sal), job
 FROM emp
 GROUP BY job ;

SELECT MAX(sal) �����ִ�, SUM(sal) ��������޿��հ�, job
 FROM emp
 GROUP BY job ;
 
SELECT MAX(sal) �����ִ�, SUM(sal) ��������޿��հ�, job, deptno
 FROM emp
 GROUP BY job, deptno ;
 
 
-- GROUP BY���� ������ �� �� ����ϴ� HAVING�� >> �̹� ���� �ִ� ������(�׷��ε��Լ���) WHERE ��ſ� HAVING���� �������
SELECT MAX(sal) �����ִ�, SUM(sal) ��������޿��հ�, job
 FROM emp
 GROUP BY job
 HAVING MAX(sal) > 4000;

SELECT deptno, job, AVG(sal)
 FROM emp
 GROUP BY deptno , job
 HAVING AVG(sal) >= 3000
 ORDER BY deptno , job;

SELECT deptno, UPPER(job), AVG(sal), MAX(sal), MIN(sal), SUM(sal), COUNT(*)
 FROM emp
 GROUP BY deptno , job
 HAVING AVG(sal) >= 1000
 ORDER BY deptno , job;


-- ROLLUP, CUBE : �׷�ȭ �������� �հ�
SELECT deptno, NVL(job, '�հ�') job,
                           UPPER(job), ROUND(AVG(sal),0) �޿����, 
                           MAX(sal) �޿��ִ�, 
                           SUM(sal) �޿��հ�,
                           COUNT(*) �׷캰������
 FROM emp
 GROUP BY ROLLUP(deptno , job);
-- HAVING AVG(sal) >= 1000
-- ORDER BY deptno , job;


-- *************************************************** �̰Ÿ𸣰ڴ� >> ���̺��� �����ؾ��� (��ҹ��� �����Ͽ� ���� �ν��Ѵٰ��մϴ�)
SELECT deptno, job, AVG(sal), MAX(sal), MIN(sal), SUM(sal), COUNT(*)
 FROM emp
 GROUP BY deptno , job
 HAVING AVG(sal) >= 1000;



-- ����ġ�°� (����������������� �ФФФ�)
SELECT empno, job, sal from emp
 UNION
SELECT deptno, dname, deptno from dept;