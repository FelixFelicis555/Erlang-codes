-module(assignment1).
-export([is_cool_temp/1,to_fahrenheit/1]).
is_cool_temp({X,Y}) when Y>=25 , Y=<35->{X,true};
is_cool_temp({X,_}) ->{X,false}. 
to_fahrenheit(A)->1.8*A+32.