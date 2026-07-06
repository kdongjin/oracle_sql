-- select 문기능

-- 1. departments 레코드를 조사
select * from departments;

-- <문제> EMPLOYEES 테이블의 모든 레코드를 출력
select * from employees;

-- 2. departments 테이블에서 department_id , department_name 항목만 보고싶다.
select  department_id , department_name from departments;

-- <문제> 사원의 이름과 급여와 입사일자 만을 출력하는 SQL 문을 작성해보자. (employees) 
-- 힌트 : 테이블 EMPLOYEES, 사원이름 칼럼은 FIRST_NAME, LAST_NAME과, 급여 SALARY, 입사일자 HIRE_DATE
select FIRST_NAME, LAST_NAME, SALARY, HIRE_DATE   from employees;

-- 3. 컬럼이름 별칭부치기 
select FIRST_NAME as a, LAST_NAME as b, SALARY as c, HIRE_DATE   from employees;
select FIRST_NAME  이름, LAST_NAME  b, SALARY  c, HIRE_DATE   from employees;

-- 4. 연결연산자(concatenation) : 자바에서 문자열 + 숫자 
select  *   from  employees;
-- 사원번호는 100 이고 사원의 이름 Stenven king 이메일주소는 sking 입니다.
select '사원번호는'|| employee_id  || '이고 사원의 이름'|| first_name || last_name || '입니다.' as info from employees; 

-- 5. 중복된 데이터를 한번씩만 출력하는기능(DISTINCT)
select  DISTINCT job_id from employees;

-- <문제>직원(employess)들이 어떤 부서에 소속되어 있는지 소속 부서번호(DEPARTMENT_ID) 출력하되 중복되지 않고 
-- 한번씩 출력하는 쿼리문을 작성하자.
select DISTINCT department_id from employees;

-- 6. 조건문(if => where) 
-- employees 에서 급여를 3000 이상 받는 직원을 대상
select * from employees where salary >= 3000;

-- <문제> EMPLOYEES 테이블에서 부서번호가 110번인 직원에 관한 모든 정보만 출력하라.
SELECT * FROM employees WHERE department_id = 110;

-- <문제> EMPLOYEES 테이블에서 급여가 5000미만이 되는 직원의 정보 중에서 사번과 이름, 급여를 출력 하라.
SELECT job_id, first_name, last_name, salary FROM employees WHERE salary < 5000;

-- 7  이름(FIRST_NAME)이 'Lex'인 직원출력
select * from employees where first_name = 'Lex';

-- <문제> 이름이 John인 사람의 직원번호와 직원명과 직급을 출력하라. 
SELECT EMPLOYEE_ID, job_id, first_name, last_name FROM employees where first_name = 'John';

-- 8. 날짜 데이터 조회 (>  <)
-- <예> 2008년 이후에 입사한 직원
select * from employees where hire_date > '2008/01/01';

-- 9 AND  =>  BETWEEN AND 연산자 , OR  =>  IN 연산자 , NOT 조건
-- <예> 부서번호가 100번이고 직급이 FI_MGR인 직원
select * from employees where department_id = 100 and  job_id = 'FI_MGR';

--<문제>급여가 5000에서 10000이하 직원 정보 출력
SELECT * from employees where salary >= 5000 and salary <= 10000;
SELECT * from employees where salary BETWEEN  5000 and 10000;

-- <예> 부서번호가 100번이거나 직급이 FI_MGR인 직원
select * from employees where department_id = 100 or job_id = 'FI_MGR';

-- <문제> 직원번호가 134이거나 201이거나 107인 직원 정보 출력
select * from employees where EMPLOYEE_ID=134 or EMPLOYEE_ID=201 or EMPLOYEE_ID=107;
select * from employees where EMPLOYEE_ID   in (134 , 201, 107);

-- <예> 부서번호가 100번이 아닌 직원 
select * from employees where department_id != 100;   -- 강추
select * from employees where department_id <> 100;   -- 강추
select * from employees where department_id ^= 100;
select * from employees where NOT department_id = 100;

-- <문제> 직급이 FI_MGR가 아닌 직원 
select * from employees where job_id != 'FI_MGR';

-- <문제> 급여가 2500에서 4500까지의 범위에 속한 직원의 직원번호, 이름, 급여를 출력하라. 
-- (AND 연산자와 BETWEEN AND 연산자 사용 두개모두 사용해서 보여줄것) 
SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary BETWEEN 2500 AND 4500;

SELECT employee_id, first_name, last_name, salary FROM employees WHERE salary >= 2500 AND salary <= 4500;


-- <문제> 커미션비율이 0.3 이거나 0.05 이거나 0.1 중의 하나인 직원의 직원번호, 이름, 급여, 커미션 비율을 출력하라. 
-- (OR 연산자와 IN 연산자 사용 모두 사용해볼것)
select employee_id, first_name, salary, COMMISSION_PCT from employees 
where COMMISSION_PCT =0.3 or COMMISSION_PCT =0.05 or COMMISSION_PCT =0.1;

select employee_id, first_name, salary, COMMISSION_PCT from employees  where COMMISSION_PCT in(0.3,0.05,0.1);

-- 10 LIKE 연산자 (_ : 1글자이고 (여기에 무엇이 와도 상관이 없다))  (% : 없거나. 또는 1글자이상 무엇이와도 상관이 없다)
-- <예> K로 시작하는 사원
select * from employees where first_name like 'K%';


-- <예> 이름 중에 k를 포함하는 사원 
select * from employees where last_name like '%k%';

-- <예> 이름이 k로 끝나는 사원 
select * from employees where first_name like '%k';

-- <예> 이름의 두 번째 글자가 d인 사원 
select * from employees where first_name like '_d%';

-- <문제> 이름에 a를 포함하지 않은 직원의 직원번호, 이름을 출력하라.
SELECT employee_id, first_name FROM employees  WHERE upper(first_name) NOT LIKE '%A%';


-- 11 NULL은 (연산, 할당, 비교가 불가능)하다. 
--<예> 커미션을 받지 않는 사원에 대한 검색  (비교안됨 commission_pct = NULL  =>commission_pct is NULL )
select * from employees where commission_pct = NULL;  -- 틀림
select * from employees where commission_pct is NULL; -- 맞음
select * from employees where commission_pct is  not NULL;  -- 맞음


-- <문제> 자신의 직속상관이 없는 직원의 전체 이름과 직급과 직원번호을 출력하라 
select first_name, last_name, job_id, employee_id from employees where manager_id is NULL;

-- 12  order by  필드명 asc, order by 필드명 desc
-- <예>사번을 기준으로 오름차순으로 정렬
select * from employees order by employee_id asc; 

-- <예>사번을 기준으로 오름차순으로 정렬  부서번호가 100이 아닌 부서에서 
select * from employees where department_id <>100  order by employee_id asc;

--<문제> 직원번호, 이름, 급여를 급여가 높은 순으로 출력하라.
SELECT employee_id, first_name, last_name, salary FROM employees ORDER BY salary DESC;

--<문제> 입사일이 가장 최근인 직원 순으로 직원번호, 이름, 입사일을 출력하라.
SELECT employee_id, first_name, last_name, hire_date FROM employees ORDER BY hire_date DESC;















