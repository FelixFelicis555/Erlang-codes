-module(assignment3).
-export([for/4,indexinlist/3,forall/2,there_exists/2,there_exists1/2,foldl/3,foldr/3,filterl/2,filterr/2,remdups/1]).

for(I,Pred,Update,Body)->
case Pred(I) of
true->Body(I),for(Update(I),Pred,Update,Body);
false->ok
end.

indexinlist(L,X,F)->indexinlist(L,X,F,0).
indexinlist([],X,F,_)->not_found;
indexinlist([H|T],X,F,Acc)->
case F(X,H) of
true->Acc;
false->indexinlist(T,X,F,Acc+1)
end.

forall([],F)->satisfies;
forall([H|T],F)->
case F(H) of
true->forall(T,F);
false->doesnt_Satisfy
end.

there_exists([],F)->doesnt_satisfy;
there_exists([H|T],F)->
case F(H) of
true->satisfies;
false->there_exists(T,F)
end.


there_exists1(L,F)->there_exists1(L,F,0).
there_exists1([],_,1)->satisfies;
there_exists1(L,_,2)->doesnt_satisfy;
there_exists1([],_,0)->doesnt_satisfy;
there_exists1([H|T],F,Acc)->
case F(H) of
true->there_exists1(T,F,Acc+1);
false->there_exists1(T,F,Acc)
end. 

foldl(_,[],Acc)->Acc;
foldl(F,[H|T],Acc)->foldl(F,T,F(Acc,H)).

foldr(F,L,Acc)->foldr(F,L,Acc,1).
foldr(F,L,Acc,1)->P=lists:reverse(L),foldr(F,P,Acc,2);
foldr(_,[],Acc,X)->Acc;
foldr(F,[H|T],Acc,X)->foldr(F,T,F(Acc,H),X).

filterl(P, L) ->
F = fun(Acc,X) ->
case P(X) of
true  -> [X|Acc];
false -> Acc
end
end,
lists:reverse(foldl(F, L, [])).


filterr(P, L) ->
F = fun(Acc,X) ->
case P(X) of
true  -> [X|Acc];
false -> Acc
end
end,
lists:reverse(foldr(F, L, [])).

remdups(L)->
F=fun(Acc,X)->
case Acc=:=[] of
true->[X|Acc];
false->[H|T]=Acc,
	case H=:=X of
	true->Acc;
	false->[X|Acc]
end
end
end,
lists:reverse(foldl(F, L, [])).