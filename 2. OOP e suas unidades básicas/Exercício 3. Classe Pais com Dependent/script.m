clear;
load('dados_paises_220417.mat');
alemanha = Pais(dados_tabela.alemanha);
japao = Pais(dados_tabela.japao);
eua = Pais(dados_tabela.eua);
africa_do_sul = Pais(dados_tabela.africa_do_sul);
australia = Pais(dados_tabela.australia);

japao.C_nome_antigo = 0*japao.C;