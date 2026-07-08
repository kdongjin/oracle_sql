--  조인

-- 1. cross join (두개의 테이블을 크로스한다)
select count(*) from employees; -- 107
select count(*) from departments;  -- 27

select * from employees, departments  where first_name like '%a%';

-- ANSI 협회정한 cross join
select * from employees, departments;  -- 107 * 27
select * from employees cross join departments;  -- 107 * 27



-- 2. inner join (employees 테이블과 ,departments 테이블을 조인해서 보여주시오)
--  pk: Departements.departement_id   fk:Employees.derpartment_id
--  first_name, email, job, 연봉, 부서명, 부서위치를 출력하는 조인문을 작성하시오. 
select * from user_cons_columns where table_name = 'EMPLOYEES';

--  pk: Departements.departement_id   fk:Employees.derpartment_id
--  first_name, email, job, 연봉, 부서명, 부서위치를 출력하는 조인문을 작성하시오.
--  그런데 판매처(shipping) 만 보여주시오.  연봉이 5000달러 이상인  사원을 보여주시오. 
-- inner join   ~~ on

-- ANSI 협회정한 inner join
SELECT *
FROM employees e, departments d 
where e.department_id = d.department_id; 


SELECT *
FROM employees e INNER JOIN departments d 
ON e.department_id = d.department_id; 

-- USING을 이용한 조인 조건 지정
SELECT *
FROM employees e INNER JOIN departments d 
using(department_id); 

SELECT e.first_name, e.email, e.job_id, e.salary, d.department_name, d.location_id
FROM employees e INNER JOIN departments d 
ON e.department_id = d.department_id
where upper(d.department_name) = 'SHIPPING' AND e.salary >= 5000;


SELECT *
FROM employees e INNER JOIN departments d 
ON e.department_id = d.department_id; 

-- right outer join, left outer join  
SELECT e.first_name, d.department_id, d.department_name
FROM employees e , departments d 
where e.department_id = d.department_id(+) 
order by d.department_id asc; 

-- ANSI 협회정한 left outer join
SELECT e.first_name, d.department_id, d.department_name
FROM employees e left outer join departments d 
on e.department_id = d.department_id 
order by d.department_id asc; 

-- ANSI 협회정한 right outer join
SELECT e.first_name, d.department_id, d.department_name
FROM employees e right outer join departments d 
on e.department_id = d.department_id 
order by d.department_id asc; 

select * from departments order by department_id asc; 

-- self 조인(한개의 테이블을 두개로 분리시킨다. 한개 pk , 다른한개 fk
-- employees 를 self join을 통해서 사원의 정보와 사원의 사수의 정보를 출력하는 쿼리문 작성하시오.

select e1.first_name 사원, e2.first_name  사원사수 , e1.salary 사원연봉 ,e2.salary 사수연봉  
from employees e1, employees e2
where  e1.manager_id =  e2.employee_id;

-- non equl join(두개의 테이블이 아무관계가 없다. FK 가지고 있지 않다)
-- 등급을 나타내는 테이블생성  gradetbl (등급, 최소연봉, 최대연봉)

create table gradetbl(
    grade number not null,
    minsalary  number not null,
    maxsalary number not null,
    constraint pk_gradetbl_grade primary key(grade)
); 

insert into gradetbl  values(1, 2000, 5000);
insert into gradetbl  values(2, 5001, 10000);
insert into gradetbl  values(3, 10001, 20000);
insert into gradetbl  values(4, 20001, 30000);
insert into gradetbl  values(5, 30001, 50000);

commit;

select * from gradetbl;

-- 공통컬럼이 없는 employees 테이블과 gradetbl 조인을 해서 사원의이름과, 사원의 월급, 사원의 월급등급을 출력하시오.

select e.first_name, e.salary, g.grade 
from employees e, gradetbl g
where e.salary >= g.minsalary  and e.salary <= g.maxsalary;

select e.first_name, e.salary, g.grade 
from employees e, gradetbl g
where e.salary between g.minsalary and g.maxsalary; 


















