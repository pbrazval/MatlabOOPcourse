clear;
final = 100000;
primos = [1:1:final];
for j = 2:1:sqrt(final)
    nao_primos_atuais = (2*j):j:final;
    primos = setdiff(primos, nao_primos_atuais);
end
