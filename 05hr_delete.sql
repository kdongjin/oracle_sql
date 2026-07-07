-- update
-- UPDATE table_name
--   SET column_name1 = value1, column_name2 = value2, …  WHERE conditions;

-- employees 테이블을 emp 복사
create table emp2 
as
select * from employees;

desc emp;
select * from emp;

-- 제약조건걸고, 해제하는기능
-- emp  employee_id  pk 제약조건입력
alter table emp   
  add constraint pk_emp_id primary key(employee_id); 
  
alter table emp
  drop constraint pk_emp_id;
  
--  phone number  not null 제약조건
alter table emp
    modify  phone_number  varchar2(20)  constraint nn_emp_phone  not null; 

alter  table emp
    drop constraint nn_emp_phone; 

select * from user_constraints where table_name = 'EMP'; 


-- 모든 사원(emp)의 부서번호를 30번으로 수정하자.
desc emp;
update emp set department_id = 30; 
select department_id from emp;

-- DML (select, delte, update, insert) => 롤백, 커밋이 대상이 된다. 
commit; 
rollback;

-- 모든사원의(emp) 급여를 10% 인상한다. 
desc emp;
update emp set salary = (salary + salary* 0.1);

select salary_copy , salary from emp;

-- salary_copy 컬럼을 add을 하고, salary 를 복사를 진행한다. 
alter table emp
    add salary_copy number(8,2); 

update  emp set salary_copy = salary; 

-- emp 에서 입사일을 오늘날짜 수정한다. (오라클 오늘날짜 : SYSDATE)
update emp set HIRE_DATE = sysdate;
select * from emp;
desc emp;

-- (emp2 테이블)부서번호가 10번 사원의 부서번호를 30번으로 수정
update emp2 set  department_id = 30  where department_id = 10; 

select * from emp2 where department_id = 10; 


-- emp2 테이블에서 급여가 3000달러 이상인 사원만 급여를 10% 인상
update emp2 set salary = salary * 1.1 where salary >= 3000; 

-- 2007년에 입사한 사원의 입사일을 오늘로 수정한다. 
-- substr('03/06/17', 1, 2) : 1번째에서ㅕ 2개를 가져와라. 
select * from emp2 where  substr(hire_date,1,2) = '26';
update emp2 set  hire_date = sysdate where substr(hire_date, 1, 2) = '07'; 

-- emp2 테이블에서 LAST_NAME이 Russell인 사원의 급여를 17000로, 커미션 비율이 0.45로 인상된다.
update emp2 set salary = 17000, COMMISSION_PCT  = 0.45 where last_name = 'Russell';
desc emp2;
select * from emp2 where last_name = 'Russell';


















