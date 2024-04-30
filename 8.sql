do $$
declare
n integer :=456;
d integer;
sum integer:=0;
begin
for i in 1..3
loop
d = n % 10;
n = n/10;
sum =sum+d;
end loop;
raise notice 'Sum:=%',sum;
end $$


do $$
begin
for i in 1..10
loop
raise notice '%',i*i;
end loop;
end $$
