

V = zeros(1,9);
V_next =zeros(1,9);
ganma = 0.9;
alpha = 0.001;
pai_policy = 0.25;
lambda = 0.9;
R = [];
e = zeros(1,9);
time_steps = zeros(1000000,1);
v = zeros(1000000,1);
v_td = zeros(1000000,1);

R(:,1) = [10 -1 -1 0 0 0  0 0 0]; %up
R(:,2) = [10 0 -1 0 0 -1 0 0 -1]; % right 
R(:,3) = [10 0 0 0 0 0 -1 -1 -1]; % down
R(:,4) = [10 0 0 -1 0 0 -1 0 0]; % left

S(:,1) = [9 2 3 1 2 3 4 5 6]; % up
S(:,2) = [9 3 3 5 6 6 8 9 9]; % right
S(:,3) = [9 5 6 7 8 9 7 8 9]; % down
S(:,4) = [9 1 2 4 4 5 7 7 8]; % left

s = randi([1 9]);
s_next = 0;
t= 0;

s_now = s;


%%%%%%%%%%%%%%%  eligibility trace with td %%%%%%%%%%%%%



    for t = 1:1000000
    a = randi([1 4]);           %choose action a based on pai
    s_next = S(s_now,a);        %take action a, observe reward and move to the next state s_next
    omega =  R(s_now,a) + ganma*V(1,s_next) - V(1,s_now);       %compute Td error as 
    e(1,s_now) = e(1,s_now) +1;                                 %compute e(s)
        for s = 1:9
            V(1,s) = V(1,s) + alpha * omega *e(1,s);
            e(s) = ganma *lambda *e(1,s);
        end
    s_now = s_next;
    time_steps(t,1) = t;
    v(t,1) = V(1,1);
    end



disp(V)

%%%%%%%%%%%%%%%  only TD learaing %%%%%%%%%%%%%%%%%

V = zeros(1,9);
V_next =zeros(1,9);
ganma = 0.9;
alpha = 0.001;
pai_policy = 0.25;
R = [];
R(:,1) = [10 -1 -1 0 0 0  0 0 0]; %up
R(:,2) = [10 0 -1 0 0 -1 0 0 -1]; % right 
R(:,3) = [10 0 0 0 0 0 -1 -1 -1]; % down
R(:,4) = [10 0 0 -1 0 0 -1 0 0]; % left

S(:,1) = [9 2 3 1 2 3 4 5 6]; % up
S(:,2) = [9 3 3 5 6 6 8 9 9]; % right
S(:,3) = [9 5 6 7 8 9 7 8 9]; % down
S(:,4) = [9 1 2 4 4 5 7 7 8]; % left

s = randi([1 9]);
s_next = 0;
t= 0;

s_now = s;



    for t = 1:1000000
    a = randi([1 4]);
    s_next = S(s_now,a);
    V_next(1,s_now) = V(1,s_now) + alpha*(R(s_now,a) + ganma*V(1,s_next) - V(1,s_now));
    V(1,s_now) = V_next(1,s_now);
    s_now = s_next;
    v_td(t,1) = V(1,1) ;
    end



disp(V)


%%%%%%%% shoe figure  %%%%%%%%%%%
figure(1);
plot(time_steps,v);
hold on 
plot(time_steps,v_td);
legend('with elgibility trace','without elgibility trace');
ylabel('Estimation state value V(1)');
xlabel('Steps');
hold off