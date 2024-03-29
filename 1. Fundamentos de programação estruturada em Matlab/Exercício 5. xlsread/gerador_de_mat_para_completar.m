%% 8. Criando tables.
clear;
clc;

%% Est�gio 1: Listagem de pa�ses
paises = {'Alemanha', 'Estados Unidos', 'Jap�o', 'Austr�lia', '�frica do Sul'};
paises_campos = {'alemanha', 'eua', 'japao', 'australia', 'africa_do_sul'};


%% Est�gio 2: Cria��o da struct dados. 
% Crie uma struct dados em que cada
% campo ter� o nome dado por paises_campos e o conte�do ser� seus dados raw
% tomados acima.
% Lembre-se que eu posso acessar um campo dado por um string usando a
% indexa��o din�mica: minha_struct.(nome_do_campo_em_string) = y.
% Sintaxe do XLS Read: [~, ~, raw] = xlsread(nome_do_arquivo, nome_da_aba);

% C�DIGO
%
%
%

% (Completando o Est�gio 2) E se o usu�rio colocar um pa�s que n�o existe na lista? Como fazer o
% c�digo n�o parar nesse ponto, apenas fazer um disp de que o pa�s n�o foi
% adicionado?

% Est�gio 3: dentro de cada tabela temos os mesmos campos: Datas, que
% deveria estar n�o em string mas em formato datetime, e os componentes da
% Balan�a de Pagamentos C, G, I, X e M.
% Crie uma outra struct dados_tabela. A struct ter� 5 campos, 1 para cada
% pa�s, e cada campo ter� um table dentro dele.
% Lembre dos seguintes comandos:
% 3.1. Como fa�o para aplicar uma mesma fun��o para todos os elementos de
% um array de c�lulas?
% out = cellfun(@x myfunc(x), array_celular)
% 3.3. Convertendo um string para um formato datetime.
% y = datetime(x, 'InputFormat', 'dd/MM/yyyy', 'UniformOutput', false);
% 3.2. Convers�o de c�lulas em table: % Os "t�tulos" das tabela s�o dados
% por VariableNames, e temos que dizer onde est�o seus nomes.
% y = cell2table(conteudo_da_tabela, 'VariableNames', nomes_das_variaveis)


dados_tabela = struct;
for i = 1:1:length(paises_campos)
    % C�DIGO
    %
    %
    %
end

%% Est�gio 4: SALVAR VARI�VEIS EM .MAT
% Sintaxe: save(nome_do_arquivo, variavel1, variavel2...)
% C�DIGO
%
%
