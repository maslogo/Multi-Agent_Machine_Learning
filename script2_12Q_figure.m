clear
clc
%Q(É…)learning
%rule of grid world
move_table = [9 9 9 9;2 5 3 1;3 6 3 2;1 7 5 4;2 8 6 4;3 9 6 5;4 7 8 7;5 8 9 7;6 9 9 8];
reward_table = [10 10 10 10;-1 0 0 0;-1 0 -1 0;0 0 0 -1;0 0 0 0;0 0 -1 0;0 -1 0 -1;0 -1 0 0;0 -1 -1 0];

%parameters
lambda = 0.9;
gamma = 0.9;
epsilon = 0.1;
alpha = 0.1;
n = 50000;
q_lambda = zeros(n,1);

% Q-learning Algorithm
Q = rand(9,4);
s = randi([1,9]);
e = zeros(9,4);
for k = 1:n
    a = randi([1,4]);
    r = reward_table(s,a);
    s_dash = move_table(s,a);
    if rand() > epsilon
        a_dash = find(Q(s,:) == max(Q(s,:)));
    else
        a_dash = randi([1,4]);
    end
    delta = r + gamma * Q(s_dash,a_dash) - Q(s,a);
    e(s,a) = e(s,a) + 1;
    for i = 1:9
        for j = 1:4
            Q(i,j) = Q(i,j) + alpha * delta * e(i,j);
            e(i,j) = gamma * lambda * e(i,j);
        end
    end
    s = s_dash;
    a = a_dash;
    q_lambda(k) = Q(1,1);
end

%Qlearning(Epsilon is a variable)
%rule of grid world
move_table = [9 9 9 9;2 5 3 1;3 6 3 2;1 7 5 4;2 8 6 4;3 9 6 5;4 7 8 7;5 8 9 7;6 9 9 8];
reward_table = [10 10 10 10;-1 0 0 0;-1 0 -1 0;0 0 0 -1;0 0 0 0;0 0 -1 0;0 -1 0 -1;0 -1 0 0;0 -1 -1 0];

%parameters
alpha = 0.1;
gamma = 0.9;
epsilon_zero = 0.1;
n = 50000;
q_v = zeros(n,1);

% Q-learning Algorithm
Q = rand(9,4);
s = randi([1,9]);
for k = 1:n
    epsilon = epsilon_zero / (1 + 0.000001 * k);
    if rand() > epsilon
        a = find(Q(s,:) == max(Q(s,:)));
        if isrow(a) % Sometimes variable 'a' has more than one value.
            a = datasample(a,1); % Select an action randomly.
        end
    else
        a = randi([1,4]);
    end
    s_dash = move_table(s,a);
    r = reward_table(s,a);
    Q(s,a) = Q(s,a) + alpha * ( r + gamma * max(Q(s_dash,:)) - Q(s,a) );
    s = s_dash;
    q_v(k) = Q(1,1);
end

%Qlearning(Epsilon is a constant)
%rule of grid world
move_table = [9 9 9 9;2 5 3 1;3 6 3 2;1 7 5 4;2 8 6 4;3 9 6 5;4 7 8 7;5 8 9 7;6 9 9 8];
reward_table = [10 10 10 10;-1 0 0 0;-1 0 -1 0;0 0 0 -1;0 0 0 0;0 0 -1 0;0 -1 0 -1;0 -1 0 0;0 -1 -1 0];

%parameters
alpha = 0.1;
gamma = 0.9;
epsilon = 0.1;
n = 50000;
q_c = zeros(n,1);

% Q-learning Algorithm
Q = rand(9,4);
s = randi([1,9]);
for k = 1:n
    if rand() > epsilon
        a = find(Q(s,:) == max(Q(s,:)));
        if isrow(a) % Sometimes variable 'a' has more than one value.
            a = datasample(a,1); % Select an action randomly.
        end
    else
        a = randi([1,4]);
    end
    s_dash = move_table(s,a);
    r = reward_table(s,a);
    Q(s,a) = Q(s,a) + alpha * ( r + gamma * max(Q(s_dash,:)) - Q(s,a) );
    s = s_dash;
    q_c(k) = Q(1,1);
end
plot(q_lambda,'g--')
hold on
plot(q_c,'b-')
hold on
plot(q_v,'b-.')
hold off

legend('Q(É…)','Q(É√ÅÅc)','Q(É√ÅÇc)')