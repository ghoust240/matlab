%%Simboliska matematika
%%Piemers
syms a11 a12 a21 a22
A = [a11 a12; a21 a22]
syms b11 b12 b21 b22
B = [b11 b12; b21 b22]
C = A*B
D = A.*B %Sareizinajam katru elementu a11*b11...
%%Simbolisko mainigo definesana
%1.veids
x= sym('x');
y =sym('y');
sqrt(x^2)
%%Pienemsim ka x lielaks par 0
x = sym('x','positive');
sqrt(x^2)
%2.Veids
syms a11 a12 a21 a22
A = [a11 a12; a21 a22];
A'

%%pienemsim ka a11 a12 a21 a22 ir reali
syms a11 a12 a21 a22 real
A'
%%3.veids
A = sym('a', [3 4]) %matlab izveidos pats matricu 3rindas un 4 kol
%% atvasinat
syms x
diff(x^2)
%% parciali atvasin
syms x y %syms - definet
z = x^5+y^4;
diff(z,x)
diff(z,y)
%%integresana
%Nenoteiktas integralis
int(x^2,x)
syms a x
int (x^2,a)
%Noteiktas integralis
syms x
int(x^2, x,-3,3)
double(int(x^2,x,-3,3))
%%Robezas
%limit() robezas funkcija
syms x
limit(1/(x-1),x,1,'left')
%%Vienadojuma risinasana
syms x
solve(x^2-5*x+6==0,x)
%%Vienadojuma sistwmas
syms x y z
atb = solve(x+y+z==21,x+y-z==1,x-y+x==9)
%augsa izveidojan datu sistemas
atb.x%lai tikt pi vienam no vinam
atb.y
atb.z
%%izteiksmi vinkarsosana
syms x
y=(x-1)*(x-2)/((x-3)*(x-4)^2)
yd = diff(y)
simplify(yd)%vienkarsot izteiksme
%izteiksm vienk 2
syms x
y = (x-2)*(x-3);
y2 = expand(y)
%izteiksm vienk 3
factor(y2)
%izteiksm 4
horner(y)% izvilk x no iekavas
%% symboliskas konstantes
pi
format long
pi
a = vpa('pi')
b = vpa('2')%maina no string to float
c = vpa(2)
a+b+c
digits(100)
a = vpa(pi)
a = vpa(exp(1))
sqrt(a)
digits(10)
sqrt(a)
class(a)
class(b)
%%izteiksmju "skaista" attelosana
y = (x-1)*(x-2)/((x-3)*(x-4)^2);
pretty(y)
%%skaista attek -2
syms x
y = sqrt(x-4)/(x-4)^5;
yltx = latex(y)
yltx2 = ['$',yltx,'$']
text(0,0.5,yltx2,'Interpreter','latex','FontSize',32,'BackgroundColor','white')
%%Rezultatu grafisko attelosana
%% aprekina veiksana
syms x
y = x^2;
ezplot(y)
%% aprekinu veiksana
%% rezultatu grafiska attelosana ar plot
%%(2.lab un 2.uzd)
%% 1.
%pienemsim ir dota funkcija, kurai 
%ir jaatrod atvasinajums, un gan funkciju
%gan atvasinajumu bus jauzzimu grafiku
%izmanto plot intervala
%ari ar latex bus jaizvedo legend
syms x
y = x^3+2*x^2-5*x+4
%2.
yd = diff(y) %atrodam atvasinajumu
%3.izteiksmes vektorizac
%punktinu ieliksana
yv = vectorize(y)
ydv = vectorize(yd)
%% 4.definesim x ka skaitlu vektoru
x = -2:0.01:2;
yn = eval(yv); %%
ydn = eval(ydv);
%% tas bija 5.solis, izteiksmes interpretacijas
%Paskatas ir x un ielikt to
%%6solis. zimesim ar plot
plot(x,yn,x,ydn)
%% 7. anotesim grafiku
yltx = latex(y);
ydltxt = latex(yd);
h = legend(['$',yltx,'$'],['$',ydltxt,'$']),set(h,'Interpreter','Latex')