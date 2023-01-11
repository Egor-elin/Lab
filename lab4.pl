go:- hypothesis(Disease),
write('a hero with such characteristics:'),
write('Disease'),
nl,
undo.

hypothesis(dazzle):- dazzle, !
hypothesis(void):- faceless void, !
hypothesis(treant):- treant protector, !
hypothesis(unknown).

dazzle:-
    verify(range),
    verify(heal),
    verify(save).
void:-
    verify(melee),
    verify(stan),
    verify(damage).
treant:-
    verify(melee),
    verify(heal),
    verify(stan).

input(Question):-
write('would you like a'),
write(Question),
write('? '),
read(output),
nl,
((output == yes; output == y)
->
assert(yes(Question));
assert(no(Question)), fail).

:- dynamic yes/1 , no/1.
verify(Order):-
(yes(Order):-
->
true;
(no(Order)
->
fail;
input(Order))).

undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
