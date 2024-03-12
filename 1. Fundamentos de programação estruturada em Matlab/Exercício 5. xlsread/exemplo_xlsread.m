%% 1. Só usar o XLSREAD.
clear;
clc;
xlsread('Dados paises.xlsx');

%% 2. Usando o XLSREAD para ler país por país.
% Consultar sintaxe no Matlab Help.
[~, ~, raw_alemanha] = xlsread('Dados paises.xlsx', 'Alemanha');
[~, ~, raw_eua] = xlsread('Dados paises.xlsx', 'Estados Unidos');
[~, ~, raw_japao] = xlsread('Dados paises.xlsx', 'Japão');
[~, ~, raw_australia] = xlsread('Dados paises.xlsx', 'Austrália');
[~, ~, raw_africadosul] = xlsread('Dados paises.xlsx', 'África do Sul');

%% 3. Construindo uma função de múltiplas saídas.
% Apresentar o conceito de escopo de variáveis: função/base
open aux.lerPais
raw_alemanha = aux.lerPais('Alemanha');
[raw_alemanha, num_alemanha] = aux.lerPais('Alemanha');
%[raw_alemanha, num_alemanha, x] = aux.lerPais('Alemanha');

%% 4. Utilizando o comando import.
import aux.*;
raw_alemanha = aux.lerPais('Alemanha');
[raw_alemanha, num_alemanha] = lerPais('Alemanha');
%[raw_alemanha, num_alemanha, x] = aux.lerPais('Alemanha');

%% 5. Utilizando o comando for para criar uma struct com os dados de cada país, com indexação dinâmica.
% Sem eval!!!
paises = {'Alemanha', 'Estados Unidos', 'Japão', 'Austrália', 'África do Sul'};
paises_campos = {'alemanha', 'eua', 'japao', 'australia', 'africa_do_sul'};
dados = struct;
for i = 1:1:length(paises) % Ou comando size.
    dados.(paises_campos{i}) = aux.lerPais(paises{i});
end

%% 7. Mais OOP embutida em Matlab: o tratamento de erros
paises = {'Alemanha', 'Brasil', 'Japão', 'Austrália', 'África do Sul', 'China', 4, 'Japão'};
paises_campos = {'alemanha', 'brasil', 'japao', 'australia', 'africa_do_sul', 'china', 4};
for i = 1:1:length(paises) % Ou comando size.
    try
        dados.(paises_campos{i}) = aux.lerPais(paises{i});
    catch ME
        switch ME.identifier
            case 'MATLAB:xlsread:WorksheetNotFound'
                disp(['País ' paises{i} ' não consta na nossa base de dados e não foi acrescentado à estrutura.'])
            case 'MATLAB:mustBeFieldName'
                disp('Insira um string válido para nomear o campo da struct.');
            otherwise
                rethrow(ME)
        end
    end
end

%% 8. Criando tables.
paises_campos = {'alemanha', 'brasil', 'japao', 'australia', 'africa_do_sul', 'china', 4};
for i = 1:1:length(paises_campos)
    dados_cell = dados.paises_campos{i};
    dados_cell(2:end, 1) = cellfun(@(x) datetime(x, 'InputFormat', 'dd/MM/yyyy'), dados_cell(2:end, 1), 'UniformOutput', false);
    % Fazendo o mesmo com listas separadas por vírgula.
    dados_cell_copia = dados.paises_campos{i};
    args = {@(x) datetime(x, 'InputFormat', 'dd/MM/yyyy'), dados_cell_copia(2:end, 1), 'UniformOutput', false};
    dados_cell_copia = cellfun(args{:}); % Fazer exemplo de LSV no Command window.
    %
    dados_tabela = cell2table(dados_cell(2:end, 1:end), 'VariableNames', dados_cell(1,1:end));
end
