%% 8. Criando tables.
clear;
clc;
paises = {'Alemanha', 'Estados Unidos', 'Japão', 'Austrália', 'África do Sul'};
paises_campos = {'alemanha', 'eua', 'japao', 'australia', 'africa_do_sul'};
dados = struct;
for i = 1:1:length(paises) % Ou comando size.
    dados.(paises_campos{i}) = aux.lerPais(paises{i});
end
dados_tabela = struct;
for i = 1:1:length(paises_campos)
    dados_cell = dados.(paises_campos{i});
    dados_cell(2:end, 1) = cellfun(@(x) datetime(x, 'InputFormat', 'dd/MM/yyyy'), dados_cell(2:end, 1), 'UniformOutput', false);
    % Fazendo o mesmo com listas separadas por vírgula.
    dados_tabela.(paises_campos{i}) = cell2table(dados_cell(2:end, 1:end), 'VariableNames', dados_cell(1,1:end));
end