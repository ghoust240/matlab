%% Uzzimet doto funkciju
% y=A0+A*sin(2pi*f*(t-delay))
% A0 - nozime y grafika izmeru no cikiem-lidz cikiem
% A - amplituda (1.5)
% sin- (sinusoida) (var uztaisit negativu no sakuma samainit + uz -)
% f - frekvence= 1/T (T- periods. Kad grafiks atkal saksit darit to, kas 
% bija no sakuma(T=(t'beigas-t'sakums)/Npilnas perioda skaits))
% t - laiks no 0.5-6.5
% delay - lai parnest sakum, lai kosinus ne sakas no 0, bet no punkta kuru
% jus gribat
function y = signals(t)
if nargin == 0
   t = 0:0.01:6.5; % kopigais laiks
end

t_sawf = (t>=0&t<0.5); t_saw = t(t_sawf);
% t_saw = 0:0.01:0.5;
t_zerof = (t>=0.5&t<1.5); t_zero = t(t_zerof);
% t_zero = 0.5:0.01:1.5;
t_sinf=(t>=1.5&t<3.5); t_sin = t(t_sinf);
% t_sin = 1.5:0.01:3.5;
t_constf=(t>=3.5&t<5); t_const=t(t_constf);
% t_const = 3.5:0.01:5;
t_noisef=(t>=5&t<6.5); t_noise=t(t_noisef);
% t_noise = 5:0.01:6.5
%% sinusoida

A0= 0; A=1.5;
T = (3.5-1.5)/2
f = 1/T; delay=1.5;
y_sin=A0+A*sin(2*pi*f*(t_sin-delay));
plot(t_sin,y_sin)
% axis([0 6.5 -2 2]) %% komanda uzreiz jaieliek visus robezus visejam grafika!!
%% linearis mainigais signals(funkcija)
% y = k (t- delay)
% k= (ya-yb)/(ta-tb)
% y = k*t, piemers y = 0*t => y = 0
% ja y = 0 => 0=k(t-delay) sledovatelyno t=delay

k = (1-0)/(0-0.5)
delay = 0.5;
y_saw = k*(t_saw-delay);
hold on
%plot (t_saw,y_saw);
%% linija konstantes signals
% seit y - konstante, jo pa y grafika, vina stav uz vietas y = 1.5
% 3.5:0.01:5; % seit 151 elements
% un lai nebija kluda tad y ari vajag izdarit 151reizes y = [1.5 1.5 1.5 ... 1.5]
% bet lai nerakstit to 151 reizes, izveidosim nullu matricu
% y = zeros(1,151)+1.5 =>   y =zeros(size(t))+1.5;

y_const = zeros(size(t_const))+1.5;
%plot(t_const,y_const)
%% Signals uz x asi, nullu signals

y_zero =zeros(size(t_zero));
%plot(t_zero,y_zero)
%% troksnja signals
% rand - randoms- paradisies jebkura cipars no 0 lidz 1
% rand(2,4) - paradisies jebkurie ciparie matricai 2 rindas 4 kol, no 0
% lidz 1

% y_noise = rand(size(t_noise)); % rada no [ 0 lidz 1 ], bet vajag [-0.75 lidz 0.75]
y_noise = 1.5*rand(size(t_noise))-0.75;
%plot(t_noise,y_noise)
%% apvienosim visu viena vektora, no visus 5 signalus apvienosim viena
% t1 = [0 1 2 3];
% t2 = [4 5];
% t= [t1 t2] paradisies [0 1 2 3 4 5]
t = [t_saw,t_zero,t_sin,t_const,t_noise];
y = [y_saw,y_zero,y_sin,y_const,y_noise];
if nargout == 0
    plot(t,y); 
    y = []; % lai nerada daudz ciparus
end

% plot(t,y)
% matlava ir datu filtracija 
% deklaresim t= 0:6, no nulle lidz 6, 0 1 2 3 4 5 6
% parbaudam tf = t > 3, visie, kurie bus no mazak 3, bus 0, kur lielak 1
% t(tf), lai paradija, kurie visi biji lielak 3