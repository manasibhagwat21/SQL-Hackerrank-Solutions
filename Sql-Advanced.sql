--Draw the Triangle 1
set @i:=21;
select repeat('* ', @i:=@i-1)
from information_schema.tables;

--Draw the Triangle 2
set @i:=0;
select repeat('* ', @i:=@i+1)
from information_schema.tables
where @i < 20
