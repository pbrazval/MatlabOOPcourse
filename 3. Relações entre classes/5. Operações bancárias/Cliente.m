classdef Cliente < handle
    properties (Access = public)
        banco
        nome
        numero
        saldo
        status = 'aberta';
        creditos_devidos
    end
    properties (Transient)
        AccountListener
    end
    events 
        InsufficientFunds
    end
        
    methods
        function obj = Cliente(numero, nome, banco, saldo)
            obj.nome = nome;
            obj.numero = numero;
            obj.banco = banco;
            obj.saldo = saldo;
            obj.AccountListener = obj.banco.adicionarCliente(obj);
        end
        
        function obj = depositar(obj, valor)
            obj.saldo = obj.saldo + valor;
            if obj.saldo > 0
                obj.status = 'aberta';
            end
        end
        
        function obj = sacar(obj, valor)
            if strcmp(obj.status, 'fechada')&& obj.saldo <0
                disp(['Conta ' num2str(obj.numero) ' foi fechada.']);
                return
            end
            obj.saldo = obj.saldo - valor;
            if obj.saldo < 0
                notify(obj, 'InsufficientFunds')
            end
        end
        
        function lerSaldo(obj)
            disp(['Bom dia, ' obj.nome '! Seu saldo é de R$' num2str(round(obj.saldo,2)) '.']);
        end
    end
end