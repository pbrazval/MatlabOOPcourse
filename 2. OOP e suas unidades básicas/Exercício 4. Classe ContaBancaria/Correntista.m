classdef Correntista
    properties (Access = private)
        nome
        numero
        saldo = 0;
    end 
    methods
        function obj = Correntista(numero, nome, saldo)
            obj.nome = nome;
            obj.numero = numero;
            obj.saldo = saldo;
        end
        
        function depositar(obj, valor)
            obj.saldo = obj.saldo + valor;
        end
        
        function sacar(obj, valor)
            obj.saldo = obj.saldo - valor;

        end
        
        function lerSaldo(obj)
            disp(['Bom dia, ' obj.nome '! Seu saldo é de R$' num2str(round(obj.saldo,2)) '.']);
        end
    end
end