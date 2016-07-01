-module(aditya).
-export([is_prime/1,prime_factors/1,is_square_multiple/1,find_square_multiples/2]).

is_prime(N)->is_prime(N,2).
is_prime(1,_)->false;
is_prime(2,_)->true;
is_prime(N,Past) when N rem Past=:=0 ->false;
is_prime(N,Past) when Past*Past>N ->true;
is_prime(N,Past)->is_prime(N,Past+1).

prime_factors(N)->prime_factors(N,2,[]).
prime_factors(N,P,L) when P*P>N ->[N|L];
prime_factors(N,P,L) when N rem P=:=0->prime_factors(N div P,P,[P|L]);
prime_factors(N,P,L) when P=:=2->prime_factors(N,P+1,L);
prime_factors(N,P,L) ->prime_factors(N,P+2,L).

is_square_multiple(N) ->	
case length(aditya:prime_factors(N))=:=sets:size(sets:from_list(aditya:prime_factors(N))) of
		true->false;
		false->true
end.

find_square_multiples(C,Max)->find_square_multiples(C,Max,2,0).
find_square_multiples(C,Max,I,P) when P=:=C->I-C;
find_square_multiples(C,Max,I,P) when I=:=Max+C-1 ->fail;
find_square_multiples(C,Max,I,P)->
case aditya:is_square_multiple(I) of
	true -> find_square_multiples(C,Max,I+1,P+1);
	false->find_square_multiples(C,Max,I+1,0)
end.


