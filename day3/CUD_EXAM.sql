--���������۾�
--������ �Է� INSERT INTO
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
    
COMMIT; --��������
ROLLBACK; --���


------------------------------------------
-- TEST ���̺� �Է�����
INSERT INTO test
    ( idx, title, descs )
VALUES
    ( 1, '��������', NULL );

INSERT INTO test
    ( idx, title, descs )
VALUES
    ( 2, '��������2', '���볻�볻��' );

INSERT INTO test
    ( idx, title, descs, regdate )
VALUES
    ( 3, '��������3', '���볻�볻��3', SYSDATE ); 

INSERT INTO test
    ( idx, title, descs, regdate )
VALUES
    ( 4, '��������4', '���볻�볻��4', TO_DATE('2021-12-31','yyyy-mm-dd') );

COMMIT;

-- ������
SELECT SEQ_TEST.CURRVAL FROM dual;
SELECT SEQ_TEST.NEXTVAL FROM dual;

INSERT INTO test
    ( idx, title, descs, regdate )
VALUES
    ( SEQ_TEST.NEXTVAL, '��������5', '���볻�볻��5', SYSDATE ); 
    
    
INSERT INTO test
    ( idx, title, descs, regdate )
VALUES
    ( SEQ_TEST.NEXTVAL, '��������5', '���볻�볻��5', SYSDATE ); 
    
    
    
-- UPDATE ������ ����
UPDATE test
    SET title = '��������?'
      , descs = '������ ����˴ϴ�'
    WHERE idx = 6;
    
COMMIT;
-- DELETE ������ ����
DELETE FROM test
    WHERE idx = 3;
    
    
-- ��������
SELECT ROWNUM, su.ename, su.job, su.sal, su.comm FROM (
    SELECT ename, job, sal, comm FROM emp
    ORDER BY sal DESC
    )SU
    WHERE ROWNUM = 1;

