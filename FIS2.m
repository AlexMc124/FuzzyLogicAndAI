% Read in the data for the FIS
filename = ('FIS2.xlsx');
CustomerData = xlsread(filename);
% %---------------------------------------------------------------------------------------------------------------------%
%                                                %FIRST SYSTEM
% %---------------------------------------------------------------------------------------------------------------------%
% % Declare a new FIS
% a = newfis('Customer Interest', 'DefuzzificationMethod', 'som');
% 
% % This is the membership function of Account Balance
% a = addvar(a,'input','Account Balance',[0 300]);
% % and shows the fuzzification of the users account balance
% a = addmf(a,'input', 1,'Very Low Balance','gaussmf',[25 0]);
% a = addmf(a,'input', 1,'Low Balance','gaussmf',[30 40]);
% a = addmf(a,'input', 1,'Fair Balance','gaussmf',[37.5 150]);
% a = addmf(a,'input', 1,'High Balance','gaussmf',[37.5 200]);
% a = addmf(a,'input', 1,'Wealthy Balance','gaussmf',[50 300]);
% 
% % this is the one for the Number of Previous Purchases ever
% % This doesnt assume that the customer has ever made a purchase
% a = addvar(a,'input','Number of Previous Purchases',[0 30]);
% a = addmf(a,'input', 2,'Isolated Customer','trapmf',[0 0 1 1]);
% a = addmf(a,'input', 2,'Occasional Customer','trimf',[0 5 8]);
% a = addmf(a,'input', 2,'Normal Customer','trimf',[7 10 15]);
% a = addmf(a,'input', 2,'Frequent Customer','trapmf',[14 25 30 30]);
% 
% % this is the one for the Wishlist 
% % This measures the bumber of items that a User has on their wishlist
% a = addvar(a,'input','Number of Wishlist Items',[0 20]);
% a = addmf(a,'input', 3,'No Wishlist','trapmf',[0 0 1 1]);
% a = addmf(a,'input', 3,'Small Wishlist','trapmf',[0 0.2 2 5]);
% a = addmf(a,'input', 3,'Moderate Wishlist','trimf',[5 7 14]);
% a = addmf(a,'input', 3,'Large Wishlist','trapmf',[10 15 20 20]);
% 
% % Output 1: Interest(%)
% a = addvar(a, 'output', 'Interest(%)', [0 100]);
% 
% % Output 1's membership functions
% a = addmf(a, 'output', 1, 'No Interest', 'gaussmf', [6.25 0]);
% a = addmf(a, 'output', 1, 'Low Interest', 'gaussmf', [6.25 25]);
% a = addmf(a, 'output', 1, 'Medium Interest', 'gaussmf', [10 60]);
% a = addmf(a, 'output', 1, 'High Interest', 'gaussmf', [6.25 100]);
% 
% % The rulebase 
% rule1 = [ 1 1 1 1 1 1 ];
% rule2 = [ 1 1 2 1 1 1 ];
% rule3 = [ 1 1 3 1 1 1 ];
% rule4 = [ 1 1 4 2 1 1 ];
% rule5 = [ 1 2 1 1 1 1 ];
% rule6 = [ 1 2 2 1 1 1 ];
% rule7 = [ 1 2 3 2 1 1 ];
% rule8 = [ 1 2 4 3 1 1 ];
% rule9 = [ 1 3 1 2 1 1 ];
% rule10 = [ 1 3 2 3 1 1 ];
% rule11 = [ 1 3 3 4 1 1 ];
% rule12 = [ 1 3 4 4 1 1 ];
% rule13 = [ 1 4 1 2 1 1 ];
% rule14 = [ 1 4 2 2 1 1 ];
% rule15 = [ 1 4 3 3 1 1 ];
% rule16 = [ 1 4 4 3 1 1 ];
% rule17 = [ 2 1 1 1 1 1 ];
% rule18 = [ 2 1 2 3 1 1 ];
% rule19 = [ 2 1 3 3 1 1 ];
% rule20 = [ 2 1 4 3 1 1 ];
% rule21 = [ 2 2 1 1 1 1 ];
% rule22 = [ 2 2 2 2 1 1 ];
% rule23 = [ 2 2 3 2 1 1 ];
% rule24 = [ 2 2 4 3 1 1 ];
% rule25 = [ 2 3 1 2 1 1 ];
% rule26 = [ 2 3 2 3 1 1 ];
% rule27 = [ 2 3 3 4 1 1 ];
% rule28 = [ 2 3 4 4 1 1 ];
% rule29 = [ 2 4 1 2 1 1 ];
% rule30 = [ 2 4 2 3 1 1 ];
% rule31 = [ 2 4 3 4 1 1 ];
% rule32 = [ 2 4 4 4 1 1 ];
% rule33 = [ 3 1 1 1 1 1 ];
% rule34 = [ 3 1 2 2 1 1 ];
% rule35 = [ 3 1 3 2 1 1 ];
% rule36 = [ 3 1 4 3 1 1 ];
% rule37 = [ 3 2 1 2 1 1 ];
% rule38 = [ 3 2 2 2 1 1 ];
% rule39 = [ 3 2 3 3 1 1 ];
% rule40 = [ 3 2 4 3 1 1 ];
% rule41 = [ 3 3 1 2 1 1 ];
% rule42 = [ 3 3 2 3 1 1 ];
% rule43 = [ 3 3 3 3 1 1 ];
% rule44 = [ 3 3 4 4 1 1 ];
% rule45 = [ 3 4 1 3 1 1 ];
% rule46 = [ 3 4 2 3 1 1 ];
% rule47 = [ 3 4 3 4 1 1 ];
% rule48 = [ 3 4 4 4 1 1 ];
% rule49 = [ 4 1 1 2 1 1 ];
% rule50 = [ 4 1 2 2 1 1 ];
% rule51 = [ 4 1 3 3 1 1 ];
% rule52 = [ 4 1 4 3 1 1 ];
% rule53 = [ 4 2 1 2 1 1 ];
% rule54 = [ 4 2 2 3 1 1 ];
% rule55 = [ 4 2 3 3 1 1 ];
% rule56 = [ 4 2 4 4 1 1 ];
% rule57 = [ 4 3 1 3 1 1 ];
% rule58 = [ 4 3 2 3 1 1 ];
% rule59 = [ 4 3 3 4 1 1 ];
% rule60 = [ 4 3 4 4 1 1 ];
% rule61 = [ 4 4 1 3 1 1 ];
% rule62 = [ 4 4 2 4 1 1 ];
% rule63 = [ 4 4 3 4 1 1 ];
% rule64 = [ 4 4 4 4 1 1 ];
% rule65 = [ 5 1 1 2 1 1 ];
% rule66 = [ 5 1 2 3 1 1 ];
% rule67 = [ 5 1 3 4 1 1 ];
% rule68 = [ 5 1 4 4 1 1 ];
% rule69 = [ 5 2 1 3 1 1 ];
% rule70 = [ 5 2 2 3 1 1 ];
% rule71 = [ 5 2 3 3 1 1 ];
% rule72 = [ 5 2 4 4 1 1 ];
% rule73 = [ 5 3 1 3 1 1 ];
% rule74 = [ 5 3 2 3 1 1 ];
% rule75 = [ 5 3 3 4 1 1 ];
% rule76 = [ 5 3 4 4 1 1 ];
% rule77 = [ 5 4 1 4 1 1 ];
% rule78 = [ 5 4 2 4 1 1 ];
% rule79 = [ 5 4 3 4 1 1 ];
% rule80 = [ 5 4 4 4 1 1 ];
% 
% 
% % Collect the rules in an array
% ruleList = [rule1;rule2;rule3;rule4;rule5;rule6;rule7;rule8;rule9;rule10;rule11;rule12;rule13;rule14;rule15;rule16;rule17;rule18;rule19;rule20;rule21;rule22;rule23;rule24;rule25;rule26;rule27;rule28;rule29;rule30;rule31;rule32;rule33;rule34;rule35;rule36;rule37;rule38;rule39;rule40;rule41;rule42;rule43;rule44;rule45;rule46;rule47;rule48;rule49;rule50;rule51;rule52;rule53;rule54;rule55;rule56;rule57;rule58;rule59;rule60;rule61;rule62;rule63;rule64;rule65;rule66;rule67;rule68;rule69;rule70;rule71;rule72;rule73;rule74;rule75;rule76;rule77;rule78;rule79;rule80;];
% 
% % Add the rules to the system
% a = addrule(a, ruleList);
% 
% % Print the rules to the command window
% showrule(a)
% 
% 
% for i=1:size(CustomerData,1)
%         evalcustomer = evalfis([CustomerData(i, 2), CustomerData(i, 3), CustomerData(i, 4)], a);
%         fprintf('%d) In(1): %.2f, In(2) %.2f, In(3) %.2f,  => Out: %.2f \n\n',i,CustomerData(i, 2),CustomerData(i, 3),CustomerData(i, 4), evalcustomer);  
%         xlswrite('FIS2.xlsx', evalcustomer, 1, sprintf('J%d',i+1));
% end

% ruleview(a)
% figure(1)
% subplot(4,1,1), plotmf(a, 'input', 1)
% subplot(4,1,2), plotmf(a, 'input', 2)
% subplot(4,1,3), plotmf(a, 'input', 3)
% subplot(4,1,4), plotmf(a, 'output', 1)


% %---------------------------------------------------------------------------------------------------------------------%
%                                      %SECOND SYSTEM
% %---------------------------------------------------------------------------------------------------------------------%
% 
filename = ('FIS2.xlsx');
CustomerData = xlsread(filename);
% Declare a new FIS
b = newfis('Advertising Percentage', 'DefuzzificationMethod', 'som');
% This is the memebership function of User Age
% the lower limit is 18 as this is the site policy 
b = addvar(b,'input','User Age',[18 80]);
% young adult is defined from 18 to 22-> 25
b = addmf(b,'input', 1,'Young Adult','trapmf',[17 18 21 25]);
b = addmf(b,'input', 1,'Adult','trimf',[22 33 46]);
% Middle Age This time span has been defined as the time between ages 45 and 60
b = addmf(b,'input', 1,'Middle Aged','trimf',[40 50 63]);
% for this one the individual retirement age is usually between 63 and 65 years.
b = addmf(b,'input', 1,'Retired','trapmf',[60 65 80 80]); 

b=addvar(b,'input','User Interest',[0 100]);

b = addmf(b, 'input', 2, 'No Interest', 'gaussmf', [6.25 0]);
b = addmf(b, 'input', 2, 'Low Interest', 'gaussmf', [6.25 25]);
b = addmf(b, 'input', 2, 'Medium Interest', 'gaussmf', [10 60]);
b = addmf(b, 'input', 2, 'High Interest', 'gaussmf', [6.25 100]);

% Declaring a new variable - this is an Advertising Level % showing what
% level of advertising a user should recieve.
b=addvar(b,'output','Advertising Level %',[0 100]);
% Populating the output variable with membership functions
b = addmf(b, 'output', 1, 'No / Minimal Advertising', 'trapmf', [0 0 30 40]);
b = addmf(b,'output',1,'Low Advertising','trimf',[20 40 60]); 
b = addmf(b,'output',1,'Regular Advertising','trimf',[40 60 80]); 
b = addmf(b,'output',1,'Targeted Advertising','trapmf',[60 80 100 100]);

% figure(2)
% subplot(3,1,1), plotmf(b, 'input', 1)
% subplot(3,1,2), plotmf(b, 'input', 2)
% subplot(3,1,3), plotmf(b, 'output', 1)

rule81 = [ 1 1 2 1 1 ];
rule82 = [ 1 2 3 1 1 ];
rule83 = [ 1 3 4 1 1 ];
rule84 = [ 1 4 4 1 1 ];
rule85 = [ 2 1 2 1 1 ];
rule86 = [ 2 2 3 1 1 ];
rule87 = [ 2 3 3 1 1 ];
rule88 = [ 2 4 4 1 1 ];
rule89 = [ 3 1 1 1 1 ];
rule90 = [ 3 2 2 1 1 ];
rule91 = [ 3 3 3 1 1 ];
rule92 = [ 3 4 4 1 1 ];
rule93 = [ 4 1 1 1 1 ];
rule94 = [ 4 2 1 1 1 ];
rule95 = [ 4 3 2 1 1 ];
rule96 = [ 4 4 3 1 1 ];


% Collect the rules in an array
ruleListb = [rule81;rule82;rule83;rule84;rule85;rule86;rule87;rule88 ;rule89 ;rule90;rule91;rule92;rule93;rule94;rule95;rule96;];
% Add the rules to the system
b = addrule(b, ruleListb);

% Print the rules to the command window
% rules = showrule(b)

for i=1:size(CustomerData,1)
        evalcustomer = evalfis([CustomerData(i, 11), CustomerData(i, 6)], b);
        fprintf('%d) In(1): %.2f, In(2) %.2f,  => Out: %.2f \n\n',i,CustomerData(i, 11), CustomerData(i, 6), evalcustomer);  
        xlswrite('FIS2.xlsx', evalcustomer, 1, sprintf('P%d',i+1));
end






