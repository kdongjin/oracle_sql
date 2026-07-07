--1 Insert 문
-- INSERT INTO table_name (column_value, …) VALUES(column_value, …)
-- 주의: 컬럼명 정확히 지켜라, 컬럼명갯수와 values개수가 맞아야한다.
-- 컬럼명타입과 values 타입이 같아야한다.
-- not null, primary key 제약조건을 체크할것

-- dept 테이블을 생성한다
CREATE TABLE DEPT( 
    DEPTNO NUMBER(2) primary key,
    DNAME VARCHAR2(14),
    LOC VARCHAR2(13) not null
);
-- 칼럼 DEPTNO에 10번 부서, DNAME에는 ‘ACCOUNTING’을, LOC에는 ‘NEW YORK’을 추가하자
insert into dept(deptno, dname, loc) values(10, 'accounting', 'new tork');
insert into dept values(11, 'accounting1', 'new tork1');
insert into dept values(13,  null, 'new tork3');
insert into dept values(14,  '', 'new tork4');
insert into dept(dname, loc) values('accounting2', 'new tork2');

select * from dept; 
drop table dept;

select * from tab where tname = 'dept';

-- dname null값을 '임의값'으로 변경했다.     
update  dept set dname='임시값' where dname is null;     

-- 컬럼 deptno 사이즈 4로변경, dname 을 not null 변경하세요. 
alter table dept  
    modify(deptno number(4), dname varchar2(30) not null); 
desc dept;    

-- 테이블명을 변경하고자할대 dept -> dept1
RENAME dept to dept1;

select * from user_tables; 









