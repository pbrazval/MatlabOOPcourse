clear;
load('dados_paises_220417.mat');
alemanha = Pais(dados_tabela.alemanha);
japao = Pais(dados_tabela.japao);
eua = Pais(dados_tabela.eua);
mundo = Mundo;
mundo.adicionarPais(japao, 0.3);
mundo.adicionarPais(alemanha, 0.3);
mundo.adicionarPais(eua, 0.4)