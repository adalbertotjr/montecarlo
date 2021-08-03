close all;
clear;
clc;

tetaVerdadeiro = [1 2];
R = 0.02*eye(2);

nr = 10000;
n = 50;

m = zeros(2, nr);

media = zeros(2,1);
rms = zeros(2, 1);

for i = 1:nr
    
    soma1=0;
    soma2=0;
    
    for j=1:n
        [hi, yi] = sensor(tetaVerdadeiro, j, R);
        
        soma1 = soma1 + (hi'*inv(R)*hi);
        soma2 = soma2 + (hi'*inv(R)*yi);      
    end
    
        tetaEstimado = inv(soma1) * soma2; 
        
        m(:,i) =  tetaEstimado;
        media = media + tetaEstimado;
        
        erro = tetaVerdadeiro' - tetaEstimado;
        
        erroQuadratico = erro.^2;
        
        rms = rms + erroQuadratico;
    
end

media = media / nr

%rms = rms / nr;

rms = sqrt(rms)

figure
hist(m(1,:));
hold on
plot();

figure
hist(m(2,:));
hold on
plot();


