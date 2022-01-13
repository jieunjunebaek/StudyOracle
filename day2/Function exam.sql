
-- Oracle 함수
-- 문자열 함수

-- 대문자
SELECT * FROM emp
 WHERE job = UPPER('analyst');
 
SELECT UPPER('analyst') FROM dual;

-- 소문자
SELECT LOWER(ename) AS emane, LOWER(job) job FROM emp -- 첫행 이름 바꿔줬음!! AS 써도 되고 안써도 적용되네:)
 WHERE comm IS NOT NULL;

-- 같은내용 줄바꿔준내용임 
SELECT LOWER(ename) AS emane, 
       LOWER(job) job 
 FROM emp -- 첫행 이름 바꿔줬음!! AS 써도 되고 안써도 적용되네:)
 WHERE comm IS NOT NULL;

SELECT LOWER(ename) AS emane, 
       INITCAP(job) job -- INITCAP 맨앞글자만 대문자로 표현 
 FROM emp 
 WHERE comm IS NOT NULL;


-- LENGTH 글자길이
SELECT ename, LENGTH(ename) 글자수, LENGTHB(ename) 바이트수 -- LENTHB 글자 바이트수
 FROM emp;
  
SELECT LENGTHB('홍길동') FROM dual;

SELECT * FROM emp;

SELECT ename, LENGTH(ename)
 FROM emp;
 
SELECT LENGTHB('홍길동') FROM dual; 

-- SUBSTRING 원하는데서 문자 자르기
SELECT '안녕하세요. 한가람 IT전문학원 빅데이터반입니다.' phase FROM dual;
SELECT SUBSTR('안녕하세요. 한가람 IT전문학원 빅데이터반입니다.',18) phase FROM dual; --18번째부터 '빅데이터반입니다' 나옴
SELECT SUBSTR('안녕하세요. 한가람 IT전문학원 빅데이터반입니다.',18,5) phase FROM dual; --18번째부터 다섯글자 '빅데이터' 나옴

SELECT INSTR('안녕하세요. 한가람 IT전문학원 빅데이터반입니다요.','요',6) phase FROM dual;


SELECT REPLACE('안녕하세요. 한가람 IT전문학원 빅데이터반입니다.','안녕하세요','저리가세요') phase 
  FROM dual;

-- 문자합치기
SELECT 'A' || 'B' FROM dual;
SELECT CONCAT('A','B') FROM dual;


-- TRIM
SELECT '     안녕하세요     ' FROM dual;
SELECT LTRIM('     안녕하세요     ') FROM dual;
SELECT RTRIM('     안녕하세요     ') FROM dual;
SELECT TRIM('     안녕하세요     ') FROM dual;


-- ROUND 반올림 TRUNC 버림
SELECT ROUND(15.193,1) FROM dual; --15.2
SELECT ROUND(15.193) FROM dual; --15

SELECT TRUNC(15.193) FROM dual;


-- SYSDATE 현재 날짜와 시간
SELECT SYSDATE FROM dual;


-- TO_CHAR : 숫자 또는 날짜 데이터를 문자 데이터로
SELECT ename, TO_CHAR(hiredate,'yyyy-mm-dd'), TO_CHAR(sal+100) || '$' FROM emp;

SELECT TO_CHAR(SYSDATE, 'yyyy/mm/dd') -- 구글보고 따라한 예제
      ,TO_CHAR(SYSDATE, 'yyyy-mm-dd')
      ,TO_CHAR(SYSDATE, '""yyyy"년 "mm"월 "dd"일"')
 FROM dual;
 
 


-- TO_NUMBER
SELECT TO_NUMBER ('2400') + 100 FROM dual;
SELECT TO_NUMBER('100,000','999,999') FROM dual; -- 구글보고 연습한거


-- TO_DATE : 문자 데이터를 날짜 데이터로
SELECT TO_DATE('2022-01-12') FROM dual;
SELECT TO_DATE('01/12/22', 'mm/dd/yy') FROM dual;
SELECT TO_DATE('01/12/22') FROM dual;


--NVL : NULL이 아니면 그대로, NULL이면 지정한 값

SELECT ename, job, sal, sal*12 AS annsal, NVL(comm,0) comm
 FROM emp
 ORDER BY sal DESC;
 
SELECT ename, job, sal*12, NVL(comm,0) comm, (sal*12) + NVL(comm,0) AS 총연봉 
 FROM emp
 ORDER BY sal DESC;
 

--집계함수
 -- SUM : 합계
SELECT sal, NVL(comm, 0) FROM emp;
SELECT SUM(sal) totalsalary FROM emp; --25925
SELECT SUM(NVL(comm,0)) totalcommision FROM emp; --2200
SELECT SUM(comm) totalcommision FROM emp; -- 2200 SUM 함수가 계산해줘서 NULL 신경안써도 된다는데..?

    
 -- COUNT : 데이터 개수
 -- MAX : 최댓값 / MIN : 최솟값 / AVG : 평균값

SELECT MAX(sal)||'$' FROM emp; -- 5000
SELECT MIN(sal) FROM emp;
SELECT AVG(sal) FROM emp;
SELECT ROUND(AVG(sal),0) sal_avg FROM emp;

-- 결과 값을 원하는 열로 묶어 출력하는 GROUP BY 절
SELECT MAX(sal), job
 FROM emp
 GROUP BY job ;

SELECT MAX(sal) 월급최대, SUM(sal) 직업군당급여합계, job
 FROM emp
 GROUP BY job ;
 
SELECT MAX(sal) 월급최대, SUM(sal) 직업군당급여합계, job, deptno
 FROM emp
 GROUP BY job, deptno ;
 
 
-- GROUP BY절에 조건을 줄 때 사용하는 HAVING절 >> 이미 식이 있는 조건은(그룹핑된함수는) WHERE 대신에 HAVING으로 해줘야함
SELECT MAX(sal) 월급최대, SUM(sal) 직업군당급여합계, job
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


-- ROLLUP, CUBE : 그룹화 데이터의 합계
SELECT deptno, NVL(job, '합계') job,
                           UPPER(job), ROUND(AVG(sal),0) 급여평균, 
                           MAX(sal) 급여최대, 
                           SUM(sal) 급여합계,
                           COUNT(*) 그룹별집원수
 FROM emp
 GROUP BY ROLLUP(deptno , job);
-- HAVING AVG(sal) >= 1000
-- ORDER BY deptno , job;


-- *************************************************** 이거모르겠당 >> 테이블을 수정해야함 (대소문자 구분하여 식을 인식한다고합니당)
SELECT deptno, job, AVG(sal), MAX(sal), MIN(sal), SUM(sal), COUNT(*)
 FROM emp
 GROUP BY deptno , job
 HAVING AVG(sal) >= 1000;



-- 행합치는거 (이전기록지워졌나봐 ㅠㅠㅠㅠ)
SELECT empno, job, sal from emp
 UNION
SELECT deptno, dname, deptno from dept;