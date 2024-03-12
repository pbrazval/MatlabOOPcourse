%% 8. Criando tables.
clear;
clc;

% Estágio 1: Listagem de países
paises = {'Alemanha', 'Estados Unidos', 'Japão', 'Austrália', 'África do Sul'};
paises_campos = {'alemanha', 'eua', 'japao', 'australia', 'africa_do_sul'};
% Sintaxe do XLS Read: [~, ~, raw] = xlsread(nome_do_arquivo, nome_da_aba);
% E se o usuário colocar um país que não existe na lista? Como fazer o
% código não parar nesse ponto, apenas fazer um disp de que o país não foi
% adicionado?

% Estágio 2: Criação da struct dados. Crie uma struct dados em que cada
% campo terá o nome dado por paises_campos e o conteúdo será seus dados raw
% tomados acima.
% Lembre-se que eu posso acessar um campo dado por um string usando a
% indexação dinâmica: minha_struct.(nome_do_campo_em_string) = y.

dados = struct;
for i = 1:1:length(paises) % Ou comando size.
    [~, ~, dados.(paises_campos{i})] = xlsread('Dados paises.xlsx', paises{i});
end

% Estágio 3: dentro de cada tabela temos os mesmos campos: Datas, que
% deveria estar não em string mas em formato datetime, e os componentes da
% Balança de Pagamentos C, G, I, X e M.
% Crie uma outra struct dados_tabela. A struct terá 5 campos, 1 para cada
% país, e cada campo terá um table dentro dele.
% Lembre dos seguintes comandos:
% 3.1. Como faço para aplicar uma mesma função para todos os elementos de
% um array de células?
% out = cellfun(@x myfunc(x), array_celular)
% 3.3. Convertendo um string para um formato datetime.
% y = datetime(x, 'InputFormat', 'dd/MM/yyyy', 'UniformOutput', false);
% 3.2. Conversão de células em table: % Os "títulos" das tabela são dados
% por VariableNames, e temos que dizer onde estão seus nomes.
% y = cell2table(conteudo_da_tabela, 'VariableNames', nomes_das_variaveis)

dados_tabela = struct;

for i = 1:1:length(paises_campos)
    dados_cell = dados.(paises_campos{i});
    dados_cell(2:end, 1) = cellfun(@(x) datetime(x, 'InputFormat', 'dd/MM/yyyy'), dados_cell(2:end, 1), 'UniformOutput', false);
    % UniformOutput = true; Apenas quando todos os valores do resultado da
    % nossa função são células, estruturas ou escalares do mesmo formato.
    % Caso contrário, erro (mostrar erro com true e o doc)
    % Fazendo o mesmo com listas separadas por vírgula.
    dados_tabela.(paises_campos{i}) = cell2table(dados_cell(2:end, 1:end), 'VariableNames', dados_cell(1,1:end));
end