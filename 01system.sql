-- 1. 테이블스페이스(테이블저장할 공간) 생성하기(시스템관리자)
-- 저장공간이름 first01.dbf 사이즈 10M 공간확보
create tablespace firstData
datafile 'C:\oraclexe\oradata\XE\first01.dbf' size 10M;

-- 저장공간추가(수정)
alter tablespace firstData
add datafile 'C:\oraclexe\oradata\XE\first02.dbf' size 10M;

-- 저장공간사이즈 수정
alter database
datafile 'C:\oraclexe\oradata\XE\first02.dbf' resize 20M;


-- 저장공간삭제
drop tablespace firstData  including contents and datafiles;

-- 저장공간 자동설정(frist01.dbf) 
-- 기존용량이 부족하면 1M 증가시키고, 최대 20M 가능함
alter database
datafile 'C:\oraclexe\oradata\XE\first01.dbf'
AUTOEXTEND on
next 1M
MAXSIZE 20M; 

--2 사용자설정(아이디: javauser, pwd: javauser, tablespace: firstData)
ALTER SESSION SET "_ORACLE_SCRIPT"=true;

create user springuser IDENTIFIED by springuser
default TABLESPACE users
TEMPORARY TABLESPACE temp; 

--3. 사용자 권한설정(javauser에게 접속권한, 테이블 curd기능부여)
grant CONNECT, resource, dba to springuser; 

--4 접속요청을 진행하면된다. 


--5. 시퀀스 설정
create SEQUENCE emp_seq
START WITH 0
INCREMENT by 1
MINVALUE 0
MAXVALUE 1000
NOCYCLE
CACHE 2; 

















