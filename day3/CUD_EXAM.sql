--데이터조작어
--데이터 입력 INSERT INTO
--VALUES

INSERT INTO bonus
    ( ename
    , job
    , sal
    , comm
    )
VALUES
    ( ename
    , job
    , sal
    , comm
    );



INSERT INTO bonus
    ( ename
    , job
    , sal
    , comm
    )
VALUES
    ( 'JACK'
    , 'SALEMAN'
    , 4000
    , NULL
    );
    
COMMIT; --완전저장
ROLLBACK; --취소


------------------------------------------
-- TEST 테이블 입력쿼리
INSERT INTO test
    ( idx, title, descs )
VALUES
    ( 1, '내용증명', NULL );

INSERT INTO test
    ( idx, title, descs )
VALUES
    ( 2, '내용증명2', '내용내용내용' );

INSERT INTO test
    ( idx, title, descs, regdate )
VALUES
    ( 3, '내용증명3', '내용내용내용3', SYSDATE ); 

INSERT INTO test
    ( idx, title, descs, regdate )
VALUES
    ( 4, '내용증명4', '내용내용내용4', TO_DATE('2021-12-31','yyyy-mm-dd') );

COMMIT;

-- 시퀀스
SELECT SEQ_TEST.CURRVAL FROM dual;
SELECT SEQ_TEST.NEXTVAL FROM dual;

INSERT INTO test
    ( idx, title, descs, regdate )
VALUES
    ( SEQ_TEST.NEXTVAL, '내용증명5', '내용내용내용5', SYSDATE ); 
    
    
INSERT INTO test
    ( idx, title, descs, regdate )
VALUES
    ( SEQ_TEST.NEXTVAL, '내용증명5', '내용내용내용5', SYSDATE ); 
    
    
    
-- UPDATE 데이터 수정
UPDATE test
    SET title = '내용증명?'
      , descs = '내용이 변경됩니다'
    WHERE idx = 6;
    
COMMIT;
-- DELETE 데이터 삭제
DELETE FROM test
    WHERE idx = 3;
    
    
-- 서브쿼리
SELECT ROWNUM, su.ename, su.job, su.sal, su.comm FROM (
    SELECT ename, job, sal, comm FROM emp
    ORDER BY sal DESC
    )SU
    WHERE ROWNUM = 1;

