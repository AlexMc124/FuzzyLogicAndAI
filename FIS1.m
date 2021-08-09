% this is the command to create and name the FIS (Fuzzy Inference System) 
a = newfis('Customer Interest', 'DefuzzificationMethod', 'bisector');

% add the first Variable to the FIS to a, naming it as an input variable,
% name of the variable and the bounds that the variable can have 


% This is the memebership function of User Age
% the lower limit is 18 as this is the site policy 
a = addvar(a,'input','User Age',[18 80]);
% young adult is defined from 18 to 22-> 25
a = addmf(a,'input', 1,'Young Adult','trapmf',[17 18 21 25]);
a = addmf(a,'input', 1,'Adult','trimf',[22 33 46]);
% Middle Age This time span has been defined as the time between ages 45 and 60
a = addmf(a,'input', 1,'Middle Aged','trimf',[40 50 63]);
% for this one the individual retirement age is usually between 63 and 65 years.
a = addmf(a,'input', 1,'Retired','trapmf',[60 65 80 80]); 

% This is the membership function of Account Balance
a = addvar(a,'input','Account Balance',[0 300]);
% and shows the fuzzification of the users account balance
a = addmf(a,'input', 2,'Very Low Balance','trapmf',[0 0 5 6]);
a = addmf(a,'input', 2,'Low Balance','trapmf',[0 5 45 75]);
a = addmf(a,'input', 2,'Fair Balance','trimf',[40 75 145]);
a = addmf(a,'input', 2,'High Balance','trimf',[75 150 250]);
a = addmf(a,'input', 2,'Wealthy Balance','trapmf',[160 250 500 500]);


% this is the one for the Number of Previous Purchases ever
% This doesnt assume that the customer has ever made a purchase
a = addvar(a,'input','Number of Previous Purchases',[0 10]);
a = addmf(a,'input', 3,'Isolated Customer','trapmf',[0 0 1 1]);
a = addmf(a,'input', 3,'Occasional Customer','trimf',[0.75 2 3]);
a = addmf(a,'input', 3,'Normal Customer','trimf',[2 4 6]);
a = addmf(a,'input', 3,'Frequent Customer','trapmf',[5 7 10 10]);

% this is the one for the Wishlist 
% This measures the bumber of items that a User has on their wishlist
a = addvar(a,'input','Number of Wishlist Items',[0 10]);
a = addmf(a,'input', 4,'No Wishlist','trapmf',[0 0 1 1]);
a = addmf(a,'input', 4,'Small Wishlist','trimf',[0.75 2 5]);
a = addmf(a,'input', 4,'Moderate Wishlist','trimf',[2 6 8]);
a = addmf(a,'input', 4,'Large Wishlist','trapmf',[6 7 10 10]);


% Declaring a new variable - this is an Advertising Level % showing what
% level of advertising a user should recieve.
a=addvar(a,'output','Advertising Level %',[0 100]);
% Populating the output variable with membership functions
a = addmf(a, 'output', 1, 'No / Minimal Advertising', 'trapmf', [0 0 30 40]);
a = addmf(a,'output',1,'Low Advertising','trimf',[20 40 60]); 
a = addmf(a,'output',1,'Regular Advertising','trimf',[40 60 80]); 
a = addmf(a,'output',1,'Targeted Advertising','trapmf',[60 80 100 100]);

% Rule Base
% The rule declarations
% The rulebase works like this 
% rule# = [ RULE 1, RULE 2, RULE 3, RULE4, OUTPUT, WEIGHT, OPERATOR ] 
rule1 = [ 1 1 1 1 1 1 1 ];
rule2 = [ 1 1 1 2 1 1 1 ];
rule3 = [ 1 1 1 3 1 1 1 ];
rule4 = [ 1 1 1 4 1 1 1 ];
rule5 = [ 1 1 2 1 1 1 1 ];
rule6 = [ 1 1 2 2 1 1 1 ];
rule7 = [ 1 1 2 3 2 1 1 ];
rule8 = [ 1 1 2 4 2 1 1 ];
rule9 = [ 1 1 3 1 2 1 1 ];
rule10 = [ 1 1 3 2 2 1 1 ];
rule11 = [ 1 1 3 3 2 1 1 ];
rule12 = [ 1 1 3 4 3 1 1 ];
rule13 = [ 1 1 4 1 2 1 1 ];
rule14 = [ 1 1 4 2 3 1 1 ];
rule15 = [ 1 1 4 3 3 1 1 ];
rule16 = [ 1 1 4 4 4 1 1 ];
rule17 = [ 1 2 1 1 1 1 1 ];
rule18 = [ 1 2 1 2 1 1 1 ];
rule19 = [ 1 2 1 3 2 1 1 ];
rule20 = [ 1 2 1 4 2 1 1 ];
rule21 = [ 1 2 2 1 1 1 1 ];
rule22 = [ 1 2 2 2 2 1 1 ];
rule23 = [ 1 2 2 3 3 1 1 ];
rule24 = [ 1 2 2 4 3 1 1 ];
rule25 = [ 1 2 3 1 2 1 1 ];
rule26 = [ 1 2 3 2 2 1 1 ];
rule27 = [ 1 2 3 3 3 1 1 ];
rule28 = [ 1 2 3 4 3 1 1 ];
rule29 = [ 1 2 4 1 2 1 1 ];
rule30 = [ 1 2 4 2 3 1 1 ];
rule31 = [ 1 2 4 3 3 1 1 ];
rule32 = [ 1 2 4 4 4 1 1 ];
rule33 = [ 1 3 1 1 1 1 1 ];
rule34 = [ 1 3 1 2 2 1 1 ];
rule35 = [ 1 3 1 3 3 1 1 ];
rule36 = [ 1 3 1 4 3 1 1 ];
rule37 = [ 1 3 2 1 2 1 1 ];
rule38 = [ 1 3 2 2 3 1 1 ];
rule39 = [ 1 3 2 3 3 1 1 ];
rule40 = [ 1 3 2 4 4 1 1 ];
rule41 = [ 1 3 3 1 3 1 1 ];
rule42 = [ 1 3 3 2 3 1 1 ];
rule43 = [ 1 3 3 3 3 1 1 ];
rule44 = [ 1 3 3 4 4 1 1 ];
rule45 = [ 1 3 4 1 3 1 1 ];
rule46 = [ 1 3 4 2 3 1 1 ];
rule47 = [ 1 3 4 3 4 1 1 ];
rule48 = [ 1 3 4 4 4 1 1 ];
rule49 = [ 1 4 1 1 1 1 1 ];
rule50 = [ 1 4 1 2 2 1 1 ];
rule51 = [ 1 4 1 3 3 1 1 ];
rule52 = [ 1 4 1 4 4 1 1 ];
rule53 = [ 1 4 2 1 3 1 1 ];
rule54 = [ 1 4 2 2 4 1 1 ];
rule55 = [ 1 4 2 3 4 1 1 ];
rule56 = [ 1 4 2 4 4 1 1 ];
rule57 = [ 1 4 3 1 4 1 1 ];
rule58 = [ 1 4 3 2 4 1 1 ];
rule59 = [ 1 4 3 3 4 1 1 ];
rule60 = [ 1 4 3 4 4 1 1 ];
rule61 = [ 1 4 4 1 4 1 1 ];
rule62 = [ 1 4 4 2 4 1 1 ];
rule63 = [ 1 4 4 3 4 1 1 ];
rule64 = [ 1 4 4 4 4 1 1 ];
rule65 = [ 1 5 1 1 3 1 1 ];
rule66 = [ 1 5 1 2 4 1 1 ];
rule67 = [ 1 5 1 3 4 1 1 ];
rule68 = [ 1 5 1 4 4 1 1 ];
rule69 = [ 1 5 2 1 4 1 1 ];
rule70 = [ 1 5 2 2 4 1 1 ];
rule71 = [ 1 5 2 3 4 1 1 ];
rule72 = [ 1 5 2 4 4 1 1 ];
rule73 = [ 1 5 3 1 4 1 1 ];
rule74 = [ 1 5 3 2 4 1 1 ];
rule75 = [ 1 5 3 3 4 1 1 ];
rule76 = [ 1 5 3 4 4 1 1 ];
rule77 = [ 1 5 4 1 4 1 1 ];
rule78 = [ 1 5 4 2 4 1 1 ];
rule79 = [ 1 5 4 3 4 1 1 ];
rule80 = [ 1 5 4 4 4 1 1 ];
rule81 = [ 2 1 1 1 1 1 1 ];
rule82 = [ 2 1 1 2 1 1 1 ];
rule83 = [ 2 1 1 3 1 1 1 ];
rule84 = [ 2 1 1 4 2 1 1 ];
rule85 = [ 2 1 2 1 1 1 1 ];
rule86 = [ 2 1 2 2 1 1 1 ];
rule87 = [ 2 1 2 3 1 1 1 ];
rule88 = [ 2 1 2 4 2 1 1 ];
rule89 = [ 2 1 3 1 1 1 1 ];
rule90 = [ 2 1 3 2 1 1 1 ];
rule91 = [ 2 1 3 3 1 1 1 ];
rule92 = [ 2 1 3 4 2 1 1 ];
rule93 = [ 2 1 4 1 1 1 1 ];
rule94 = [ 2 1 4 2 2 1 1 ];
rule95 = [ 2 1 4 3 2 1 1 ];
rule96 = [ 2 1 4 4 3 1 1 ];
rule97 = [ 2 2 1 1 1 1 1 ];
rule98 = [ 2 2 1 2 1 1 1 ];
rule99 = [ 2 2 1 3 2 1 1 ];
rule100 = [ 2 2 1 4 2 1 1 ];
rule101 = [ 2 2 2 1 1 1 1 ];
rule102 = [ 2 2 2 2 2 1 1 ];
rule103 = [ 2 2 2 3 2 1 1 ];
rule104 = [ 2 2 2 4 2 1 1 ];
rule105 = [ 2 2 3 1 1 1 1 ];
rule106 = [ 2 2 3 2 2 1 1 ];
rule107 = [ 2 2 3 3 2 1 1 ];
rule108 = [ 2 2 3 4 3 1 1 ];
rule109 = [ 2 2 4 1 2 1 1 ];
rule110 = [ 2 2 4 2 3 1 1 ];
rule111 = [ 2 2 4 3 3 1 1 ];
rule112 = [ 2 2 4 4 4 1 1 ];
rule113 = [ 2 3 1 1 1 1 1 ];
rule114 = [ 2 3 1 2 1 1 1 ];
rule115 = [ 2 3 1 3 1 1 1 ];
rule116 = [ 2 3 1 4 2 1 1 ];
rule117 = [ 2 3 2 1 1 1 1 ];
rule118 = [ 2 3 2 2 2 1 1 ];
rule119 = [ 2 3 2 3 2 1 1 ];
rule120 = [ 2 3 2 4 2 1 1 ];
rule121 = [ 2 3 3 1 3 1 1 ];
rule122 = [ 2 3 3 2 3 1 1 ];
rule123 = [ 2 3 3 3 3 1 1 ];
rule124 = [ 2 3 3 4 3 1 1 ];
rule125 = [ 2 3 4 1 3 1 1 ];
rule126 = [ 2 3 4 2 4 1 1 ];
rule127 = [ 2 3 4 3 4 1 1 ];
rule128 = [ 2 3 4 4 4 1 1 ];
rule129 = [ 2 4 1 1 1 1 1 ];
rule130 = [ 2 4 1 2 2 1 1 ];
rule131 = [ 2 4 1 3 2 1 1 ];
rule132 = [ 2 4 1 4 3 1 1 ];
rule133 = [ 2 4 2 1 2 1 1 ];
rule134 = [ 2 4 2 2 2 1 1 ];
rule135 = [ 2 4 2 3 3 1 1 ];
rule136 = [ 2 4 2 4 4 1 1 ];
rule137 = [ 2 4 3 1 2 1 1 ];
rule138 = [ 2 4 3 2 3 1 1 ];
rule139 = [ 2 4 3 3 3 1 1 ];
rule140 = [ 2 4 3 4 4 1 1 ];
rule141 = [ 2 4 4 1 2 1 1 ];
rule142 = [ 2 4 4 2 3 1 1 ];
rule143 = [ 2 4 4 3 4 1 1 ];
rule144 = [ 2 4 4 4 4 1 1 ];
rule145 = [ 2 5 1 1 2 1 1 ];
rule146 = [ 2 5 1 2 3 1 1 ];
rule147 = [ 2 5 1 3 4 1 1 ];
rule148 = [ 2 5 1 4 4 1 1 ];
rule149 = [ 2 5 2 1 3 1 1 ];
rule150 = [ 2 5 2 2 3 1 1 ];
rule151 = [ 2 5 2 3 4 1 1 ];
rule152 = [ 2 5 2 4 4 1 1 ];
rule153 = [ 2 5 3 1 3 1 1 ];
rule154 = [ 2 5 3 2 3 1 1 ];
rule155 = [ 2 5 3 3 4 1 1 ];
rule156 = [ 2 5 3 4 4 1 1 ];
rule157 = [ 2 5 4 1 3 1 1 ];
rule158 = [ 2 5 4 2 4 1 1 ];
rule159 = [ 2 5 4 3 4 1 1 ];
rule160 = [ 2 5 4 4 4 1 1 ];
rule161 = [ 3 1 1 1 1 1 1 ];
rule162 = [ 3 1 1 2 1 1 1 ];
rule163 = [ 3 1 1 3 1 1 1 ];
rule164 = [ 3 1 1 4 2 1 1 ];
rule165 = [ 3 1 2 1 1 1 1 ];
rule166 = [ 3 1 2 2 1 1 1 ];
rule167 = [ 3 1 2 3 1 1 1 ];
rule168 = [ 3 1 2 4 2 1 1 ];
rule169 = [ 3 1 3 1 1 1 1 ];
rule170 = [ 3 1 3 2 1 1 1 ];
rule171 = [ 3 1 3 3 1 1 1 ];
rule172 = [ 3 1 3 4 2 1 1 ];
rule173 = [ 3 1 4 1 2 1 1 ];
rule174 = [ 3 1 4 2 2 1 1 ];
rule175 = [ 3 1 4 3 3 1 1 ];
rule176 = [ 3 1 4 4 4 1 1 ];
rule177 = [ 3 2 1 1 1 1 1 ];
rule178 = [ 3 2 1 2 1 1 1 ];
rule179 = [ 3 2 1 3 1 1 1 ];
rule180 = [ 3 2 1 4 2 1 1 ];
rule181 = [ 3 2 2 1 1 1 1 ];
rule182 = [ 3 2 2 2 2 1 1 ];
rule183 = [ 3 2 2 3 2 1 1 ];
rule184 = [ 3 2 2 4 2 1 1 ];
rule185 = [ 3 2 3 1 1 1 1 ];
rule186 = [ 3 2 3 2 2 1 1 ];
rule187 = [ 3 2 3 3 3 1 1 ];
rule188 = [ 3 2 3 4 4 1 1 ];
rule189 = [ 3 2 4 1 2 1 1 ];
rule190 = [ 3 2 4 2 3 1 1 ];
rule191 = [ 3 2 4 3 3 1 1 ];
rule192 = [ 3 2 4 4 4 1 1 ];
rule193 = [ 3 3 1 1 1 1 1 ];
rule194 = [ 3 3 1 2 1 1 1 ];
rule195 = [ 3 3 1 3 2 1 1 ];
rule196 = [ 3 3 1 4 3 1 1 ];
rule197 = [ 3 3 2 1 2 1 1 ];
rule198 = [ 3 3 2 2 2 1 1 ];
rule199 = [ 3 3 2 3 3 1 1 ];
rule200 = [ 3 3 2 4 3 1 1 ];
rule201 = [ 3 3 3 1 2 1 1 ];
rule202 = [ 3 3 3 2 2 1 1 ];
rule203 = [ 3 3 3 3 3 1 1 ];
rule204 = [ 3 3 3 4 4 1 1 ];
rule205 = [ 3 3 4 1 3 1 1 ];
rule206 = [ 3 3 4 2 3 1 1 ];
rule207 = [ 3 3 4 3 4 1 1 ];
rule208 = [ 3 3 4 4 4 1 1 ];
rule209 = [ 3 4 1 1 2 1 1 ];
rule210 = [ 3 4 1 2 2 1 1 ];
rule211 = [ 3 4 1 3 2 1 1 ];
rule212 = [ 3 4 1 4 4 1 1 ];
rule213 = [ 3 4 2 1 2 1 1 ];
rule214 = [ 3 4 2 2 2 1 1 ];
rule215 = [ 3 4 2 3 3 1 1 ];
rule216 = [ 3 4 2 4 3 1 1 ];
rule217 = [ 3 4 3 1 2 1 1 ];
rule218 = [ 3 4 3 2 3 1 1 ];
rule219 = [ 3 4 3 3 4 1 1 ];
rule220 = [ 3 4 3 4 4 1 1 ];
rule221 = [ 3 4 4 1 2 1 1 ];
rule222 = [ 3 4 4 2 3 1 1 ];
rule223 = [ 3 4 4 3 4 1 1 ];
rule224 = [ 3 4 4 4 4 1 1 ];
rule225 = [ 3 5 1 1 2 1 1 ];
rule226 = [ 3 5 1 2 3 1 1 ];
rule227 = [ 3 5 1 3 3 1 1 ];
rule228 = [ 3 5 1 4 4 1 1 ];
rule229 = [ 3 5 2 1 3 1 1 ];
rule230 = [ 3 5 2 2 4 1 1 ];
rule231 = [ 3 5 2 3 4 1 1 ];
rule232 = [ 3 5 2 4 4 1 1 ];
rule233 = [ 3 5 3 1 3 1 1 ];
rule234 = [ 3 5 3 2 4 1 1 ];
rule235 = [ 3 5 3 3 4 1 1 ];
rule236 = [ 3 5 3 4 4 1 1 ];
rule237 = [ 3 5 4 1 3 1 1 ];
rule238 = [ 3 5 4 2 4 1 1 ];
rule239 = [ 3 5 4 3 4 1 1 ];
rule240 = [ 3 5 4 4 4 1 1 ];
rule241 = [ 4 1 1 1 1 1 1 ];
rule242 = [ 4 1 1 2 1 1 1 ];
rule243 = [ 4 1 1 3 1 1 1 ];
rule244 = [ 4 1 1 4 1 1 1 ];
rule245 = [ 4 1 2 1 1 1 1 ];
rule246 = [ 4 1 2 2 1 1 1 ];
rule247 = [ 4 1 2 3 2 1 1 ];
rule248 = [ 4 1 2 4 2 1 1 ];
rule249 = [ 4 1 3 1 1 1 1 ];
rule250 = [ 4 1 3 2 1 1 1 ];
rule251 = [ 4 1 3 3 2 1 1 ];
rule252 = [ 4 1 3 4 2 1 1 ];
rule253 = [ 4 1 4 1 1 1 1 ];
rule254 = [ 4 1 4 2 1 1 1 ];
rule255 = [ 4 1 4 3 2 1 1 ];
rule256 = [ 4 1 4 4 2 1 1 ];
rule257 = [ 4 2 1 1 2 1 1 ];
rule258 = [ 4 2 1 2 2 1 1 ];
rule259 = [ 4 2 1 3 3 1 1 ];
rule260 = [ 4 2 1 4 3 1 1 ];
rule261 = [ 4 2 2 1 1 1 1 ];
rule262 = [ 4 2 2 2 1 1 1 ];
rule263 = [ 4 2 2 3 2 1 1 ];
rule264 = [ 4 2 2 4 2 1 1 ];
rule265 = [ 4 2 3 1 1 1 1 ];
rule266 = [ 4 2 3 2 2 1 1 ];
rule267 = [ 4 2 3 3 3 1 1 ];
rule268 = [ 4 2 3 4 3 1 1 ];
rule269 = [ 4 2 4 1 1 1 1 ];
rule270 = [ 4 2 4 2 2 1 1 ];
rule271 = [ 4 2 4 3 3 1 1 ];
rule272 = [ 4 2 4 4 4 1 1 ];
rule273 = [ 4 3 1 1 1 1 1 ];
rule274 = [ 4 3 1 2 1 1 1 ];
rule275 = [ 4 3 1 3 1 1 1 ];
rule276 = [ 4 3 1 4 2 1 1 ];
rule277 = [ 4 3 2 1 1 1 1 ];
rule278 = [ 4 3 2 2 2 1 1 ];
rule279 = [ 4 3 2 3 2 1 1 ];
rule280 = [ 4 3 2 4 3 1 1 ];
rule281 = [ 4 3 3 1 2 1 1 ];
rule282 = [ 4 3 3 2 2 1 1 ];
rule283 = [ 4 3 3 3 2 1 1 ];
rule284 = [ 4 3 3 4 3 1 1 ];
rule285 = [ 4 3 4 1 2 1 1 ];
rule286 = [ 4 3 4 2 2 1 1 ];
rule287 = [ 4 3 4 3 2 1 1 ];
rule288 = [ 4 3 4 4 3 1 1 ];
rule289 = [ 4 4 1 1 1 1 1 ];
rule290 = [ 4 4 1 2 1 1 1 ];
rule291 = [ 4 4 1 3 2 1 1 ];
rule292 = [ 4 4 1 4 2 1 1 ];
rule293 = [ 4 4 2 1 1 1 1 ];
rule294 = [ 4 4 2 2 2 1 1 ];
rule295 = [ 4 4 2 3 2 1 1 ];
rule296 = [ 4 4 2 4 3 1 1 ];
rule297 = [ 4 4 3 1 2 1 1 ];
rule298 = [ 4 4 3 2 3 1 1 ];
rule299 = [ 4 4 3 3 4 1 1 ];
rule300 = [ 4 4 3 4 4 1 1 ];
rule301 = [ 4 4 4 1 2 1 1 ];
rule302 = [ 4 4 4 2 3 1 1 ];
rule303 = [ 4 4 4 3 4 1 1 ];
rule304 = [ 4 4 4 4 4 1 1 ];
rule305 = [ 4 5 1 1 2 1 1 ];
rule306 = [ 4 5 1 2 3 1 1 ];
rule307 = [ 4 5 1 3 3 1 1 ];
rule308 = [ 4 5 1 4 3 1 1 ];
rule309 = [ 4 5 2 1 2 1 1 ];
rule310 = [ 4 5 2 2 3 1 1 ];
rule311 = [ 4 5 2 3 4 1 1 ];
rule312 = [ 4 5 2 4 4 1 1 ];
rule313 = [ 4 5 3 1 2 1 1 ];
rule314 = [ 4 5 3 2 4 1 1 ];
rule315 = [ 4 5 3 3 4 1 1 ];
rule316 = [ 4 5 3 4 4 1 1 ];
rule317 = [ 4 5 4 1 3 1 1 ];
rule318 = [ 4 5 4 2 4 1 1 ];
rule319 = [ 4 5 4 3 4 1 1 ];
rule320 = [ 4 5 4 4 4 1 1 ];




% Collect the rules in an array
ruleList = [rule1;rule2;rule3;rule4;rule5;rule6;rule7;rule8;rule9;rule10;rule11;rule12;rule13;rule14;rule15;rule16;rule17;rule18;rule19;rule20;rule21;rule22;rule23;rule24;rule25;rule26;rule27;rule28;rule29;rule30;rule31;rule32;rule33;rule34;rule35;rule36;rule37;rule38;rule39;rule40;rule41;rule42;rule43;rule44;rule45;rule46;rule47;rule48;rule49;rule50;rule51;rule52;rule53;rule54;rule55;rule56;rule57;rule58;rule59;rule60;rule61;rule62;rule63;rule64;rule65;rule66;rule67;rule68;rule69;rule70;rule71;rule72;rule73;rule74;rule75;rule76;rule77;rule78;rule79;rule80;rule81;rule82;rule83;rule84;rule85;rule86;rule87;rule88;rule89;rule90;rule91;rule92;rule93;rule94;rule95;rule96;rule97;rule98;rule99;rule100;rule101;rule102;rule103;rule104;rule105;rule106;rule107;rule108;rule109;rule110;rule111;rule112;rule113;rule114;rule115;rule116;rule117;rule118;rule119;rule120;rule121;rule122;rule123;rule124;rule125;rule126;rule127;rule128;rule129;rule130;rule131;rule132;rule133;rule134;rule135;rule136;rule137;rule138;rule139;rule140;rule141;rule142;rule143;rule144;rule145;rule146;rule147;rule148;rule149;rule150;rule151;rule152;rule153;rule154;rule155;rule156;rule157;rule158;rule159;rule160;rule161;rule162;rule163;rule164;rule165;rule166;rule167;rule168;rule169;rule170;rule171;rule172;rule173;rule174;rule175;rule176;rule177;rule178;rule179;rule180;rule181;rule182;rule183;rule184;rule185;rule186;rule187;rule188;rule189;rule190;rule191;rule192;rule193;rule194;rule195;rule196;rule197;rule198;rule199;rule200;rule201;rule202;rule203;rule204;rule205;rule206;rule207;rule208;rule209;rule210;rule211;rule212;rule213;rule214;rule215;rule216;rule217;rule218;rule219;rule220;rule221;rule222;rule223;rule224;rule225;rule226;rule227;rule228;rule229;rule230;rule231;rule232;rule233;rule234;rule235;rule236;rule237;rule238;rule239;rule240;rule241;rule242;rule243;rule244;rule245;rule246;rule247;rule248;rule249;rule250;rule251;rule252;rule253;rule254;rule255;rule256;rule257;rule258;rule259;rule260;rule261;rule262;rule263;rule264;rule265;rule266;rule267;rule268;rule269;rule270;rule271;rule272;rule273;rule274;rule275;rule276;rule277;rule278;rule279;rule280;rule281;rule282;rule283;rule284;rule285;rule286;rule287;rule288;rule289;rule290;rule291;rule292;rule293;rule294;rule295;rule296;rule297;rule298;rule299;rule300;rule301;rule302;rule303;rule304;rule305;rule306;rule307;rule308;rule309;rule310;rule311;rule312;rule313;rule314;rule315;rule316;rule317;rule318;rule319;rule320;];

% Add the rules to the system
a = addrule(a, ruleList);

% Print the rules to the command window
showrule(a) 


% Read in the Excel data file
filename = ('TestDataFIS1.xlsx');
testData = xlsread(filename);

% The for loop processing the date and printing to the command window
% Also, it writes the outout values to the same 'TestDataFIS1.xlsx' file
for i=1:size(testData,1)
        eval = evalfis([testData(i, 2), testData(i, 3), testData(i, 4), testData(i, 5)], a);
        fprintf('%d) In(1): %.2f, In(2) %.2f, In(3) %.2f, In(4) %.2f => Out(1): %.2f \n\n',i,testData(i, 2),testData(i, 3),testData(i, 4),testData(i, 5), eval);  
        xlswrite('TestDataFIS1.xlsx', eval, 1, sprintf('k%d',i+1));
end

% The subplots to visualise the system
figure(1)
subplot(5,1,1), plotmf(a, 'input', 1)
subplot(5,1,2), plotmf(a, 'input', 2)
subplot(5,1,3), plotmf(a, 'input', 3)
subplot(5,1,4), plotmf(a, 'input', 4)
subplot(5,1,5), plotmf(a, 'output', 1)





