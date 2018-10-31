clear
clc

move_table = [9 9 9 9;2 5 3 1;3 6 3 2;1 7 5 4;2 8 6 4;3 9 6 5;4 7 8 7;5 8 9 7;6 9 9 8];
reward_table = [10 10 10 10;-1 0 0 0;-1 0 -1 0;0 0 0 -1;0 0 0 0;0 0 -1 0;0 -1 0 -1;0 -1 0 0;0 -1 -1 0];
alpha = 0.1;
gamma = 0.9;
epsilon = 0.2;
n = 1000000;
Q = rand(9,4)
s = randi([1,9]);
if rand() > epsilon
    a = find(Q(s,:) == max(Q(s,:)));
else
    a = randi([1,4]);
end

for i = 1:n
    s_dash = move_table(s,a);
    r = reward_table(s,a);
    if rand() > epsilon
        a_dash = find(Q(s_dash,:) == max(Q(s_dash,:)));
    else
        a_dash = randi([1,4]);
    end
    Q(s,a) = Q(s,a) + alpha * ( r + gamma * Q(s_dash,a_dash) - Q(s,a) );
    a = a_dash;
    s = s_dash;
end
Q