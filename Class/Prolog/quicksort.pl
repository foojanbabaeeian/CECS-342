% Quicksort Base Case
quicksort(nil, nil).

% Quicksort Recursive Case
quicksort(cons(X, Xs), S) :-
    partition(X, Xs, L, H), 
    quicksort(L, SL),
    quicksort(H, SH),
    append(SL, cons(X, SH), S).

% Partition Logic
partition(_, nil, nil, nil). % Base case: empty list.
partition(X, cons(Y, Ys), cons(Y, L), H) :- 
    Y =< X, 
    partition(X, Ys, L, H).
partition(X, cons(Y, Ys), L, cons(Y, H)) :- 
    Y > X, 
    partition(X, Ys, L, H).

% Append Two Lists
append(nil, Ys, Ys).
append(cons(X, Xs), Ys, cons(X, Zs)) :- append(Xs, Ys, Zs).