create or replace function factorial(num integer) returns integer as
$$
declare
	result integer := 1;
	i integer;
Begin
for i in 1..num
loop
result = result * i;
end loop;
return result;
end;
$$ language plpgsql;
select factorial(7);

create table emp(id numeric(3) primary key,name varchar(10),salary numeric(7));
insert into emp values(1,'Jess',143435);
insert into emp values(2,'Merrill',141422);
insert into emp values(3,'Swain',1243141);

create or replace function avg_salary() returns numeric as
$$
declare
total_salary numeric := 0;
total_records integer :=0;
avg_salary numeric;
begin
select sum(salary), count(*) into total_salary,total_records from emp;
if total_records > 0 then
avg_salary := total_salary/total_records;
else
avg_salary :=0;
end if;
return avg_salary;
end;
$$ language plpgsql;
select avg_salary();

create or replace function entry() returns trigger as
$$
begin 
insert into emp1(name,salary) values(old.name,old.salary);
raise notice 'Deleted from emp and inserted into emp1';
return old;
end;
$$ language plpgsql;

create trigger after_delete
after delete 
on emp
for each row execute function entry();

delete from emp where name='Swain'
select * from emp;

create or replace function this_date() returns trigger as
$$
begin
raise notice 'Changes to emp done on %',current_date;
return null;
end;
$$ language plpgsql;

create trigger after_updates
after delete or update or insert
on emp 
for each row execute function this_date();

create or replace function no_changes() returns trigger as 
$$
begin
raise notice 'Emp is not mutabel';
return null;
end;
$$ language plpgsql;

create trigger before_changes
before delete or update or insert
on emp 
for each row execute function no_changes();
