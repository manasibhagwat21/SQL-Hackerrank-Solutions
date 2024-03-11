--Revising the Select Query |
    select * from CITY
    where population >= 100000
    and countrycode = 'USA';

--Revising the Select Query ||
    select name from CITY 
    where population >= 120000
    and countrycode='usa';

-- Select All
   select * from CITY;

-- Select by ID
   select * from CITY where ID = 1661;

-- Japanese Cities' Attributes
    select * from CITY where countrycode='JPN';

-- Japanese Cities' Names
    select name from CITY where countrycode='JPN';

