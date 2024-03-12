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
    end
end