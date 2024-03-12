clear all;
clc;
BRB = Banco('BRB', 'BB+');
BB = Banco('Banco do Brasil', 'AAA');
joana = Correntista(111, 'Joana', BB, 1000);
BB.adicionarCash(1000)
BB.concederCredito(joana, 50);
BB.adicionarCash(1000)
maria = Correntista(222, 'Maria', BRB, 500);
BB.concederCredito(BRB, 1000);
BCB = BancoCentral.getInstance;
BCB.IB = 0.2;
% tamborete = Banco('Tamborete')
% tamborete.adicionarCliente(joana);
% x = BancoCentral.getInstance;