function out = mediaAtual
inp = cell2mat(inputdlg('Digite um n�mero!'));

persistent soma
persistent numit;

if isempty(soma)
    soma = 0;
end

soma = soma+str2double(inp);

if isempty(numit)
    numit = 0;
end
numit = numit+1;
out = soma/numit;

disp(['A m�dia at� agora � ' num2str(out)]);
    

end