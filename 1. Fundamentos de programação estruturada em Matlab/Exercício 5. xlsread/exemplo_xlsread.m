%% 1. S� usar o XLSREAD.
clear;
clc;
xlsread('Dados paises.xlsx');

%% 2. Usando o XLSREAD para ler pa�s por pa�s.
% Consultar sintaxe no Matlab Help.
[~, ~, raw_alemanha] = xlsread('Dados paises.xlsx', 'Alemanha');
[~, ~, raw_eua] = xlsread('Dados paises.xlsx', 'Estados Unidos');
[~, ~, raw_japao] = xlsread('Dados paises.xlsx', 'Jap�o');
[~, ~, raw_australia] = xlsread('Dados paises.xlsx', 'Austr�lia');
[~, ~, raw_africadosul] = xlsread('Dados paises.xlsx', '�frica do Sul');

%% 3. Construindo uma fun��o de m�ltiplas sa�das.
% Apresentar o conceito de escopo de vari�veis: fun��o/base
open aux.lerPais
raw_alemanha = aux.lerPais('Alemanha');
[raw_alemanha, num_alemanha] = aux.lerPais('Alemanha');
%[raw_alemanha, num_alemanha, x] = aux.lerPais('Alemanha');

%% 4. Utilizando o comando import.
import aux.*;
raw_alemanha = aux.lerPais('Alemanha');
[raw_alemanha, num_alemanha] = lerPais('Alemanha');
%[raw_alemanha, num_alemanha, x] = aux.lerPais('Alemanha');

%% 5. Utilizando o comando for para criar uma struct com os dados de cada pa�s, com indexa��o din�mica.
% Sem eval!!!
paises = {'Alemanha', 'Estados Unidos', 'Jap�o', 'Austr�lia', '�frica do Sul'};
paises_campos = {'alemanha', 'eua', 'japao', 'australia', 'africa_do_sul'};
dados = struct;
for i = 1:1:length(paises) % Ou comando size.
    dados.(paises_campos{i}) = aux.lerPais(paises{i});
end

%% 7. Mais OOP embutida em Matlab: o tratamento de erros
paises = {'Alemanha', 'Brasil', 'Jap�o', 'Austr�lia', '�frica do Sul', 'China', 4, 'Jap�o'};
paises_campos = {'alemanha', 'brasil', 'japao', 'australia', 'africa_do_sul', 'china', 4};
for i = 1:1:length(paises) % Ou comando size.
    try
        dados.(paises_campos{i}) = aux.lerPais(paises{i});
    catch ME
        switch ME.identifier
            case 'MATLAB:xlsread:WorksheetNotFound'
                disp(['Pa�s ' paises{i} ' n�o consta na nossa base de dados e n�o foi acrescentado � estrutura.'])
            case 'MATLAB:mustBeFieldName'
                disp('Insira um string v�lido para nomear o campo da struct.');
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
    % Fazendo o mesmo com listas separadas por v�rgula.
    dados_cell_copia = dados.paises_campos{i};
    args = {@(x) datetime(x, 'InputFormat', 'dd/MM/yyyy'), dados_cell_copia(2:end, 1), 'UniformOutput', false};
    dados_cell_copia = cellfun(args{:}); % Fazer exemplo de LSV no Command window.
    %
    dados_tabela = cell2table(dados_cell(2:end, 1:end), 'VariableNames', dados_cell(1,1:end));
end
