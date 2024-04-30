do $$
begin
for i in 1..10
loop
raise notice '%',i*i;
end loop;
end $$

do $$
declare
n integer :=0;
n1 integer :=1;
n2 integer;
begin 
for i in 1..6
loop
n2 = n +n1;
n = n1;
n1 = n2;
end loop;
raise notice '8th term of fibonaci =%',n2;
end $$
