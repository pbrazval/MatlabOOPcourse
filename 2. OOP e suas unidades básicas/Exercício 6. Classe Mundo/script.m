clear;
load('dados_paises_250417.mat');

alemanha = Pais(dados_tabela.alemanha);
japao = Pais(dados_tabela.japao);
eua = Pais(dados_tabela.eua);
africa_do_sul = Pais(dados_tabela.africa_do_sul);
australia = Pais(dados_tabela.australia);

%%
importadoresBR = Mundo;
importadoresBR.adicionarPais(alemanha, 50)
importadoresBR.adicionarPais(australia, 20);
importadoresBR.adicionarPais(eua, 100);
importadoresBR.adicionarPais(africa_do_sul, 10);
importadoresBR.adicionarPais(japao, 40);
