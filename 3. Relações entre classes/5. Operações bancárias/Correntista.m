classdef Correntista < handle
    properties (Access = public)
        banco
        nome
        numero
        saldo = 0;
        status = 'aberta';
        creditos_devidos = 0;
    end
    properties (Transient)
        ListenerDeConta
    end
    events 
        SaldoInsuficiente
    end
        
    methods
        function obj = Correntista(numero, nome, banco, saldo)
            obj.nome = nome;
            obj.numero = numero;
            obj.banco = banco;
            obj.saldo = saldo;
            obj.ListenerDeConta = obj.banco.adicionarCorrentista(obj);
        end
        
        function depositar(obj, valor)
            obj.saldo = obj.saldo + valor;
            if obj.saldo > 0
                obj.status = 'aberta';
            end
        end
        
        function sacar(obj, valor)
            if strcmp(obj.status, 'fechada')&& obj.saldo <0
                disp(['Conta ' num2str(obj.numero) ' foi fechada.']);
                return
            end
            obj.saldo = obj.saldo - valor;
            if obj.saldo < 0
                notify(obj, 'SaldoInsuficiente');
            end
        end
        
        function lerSaldo(obj)
            disp(['Bom dia, ' obj.nome '! Seu saldo é de R$' num2str(round(obj.saldo,2)) '.']);
        end
    end
end