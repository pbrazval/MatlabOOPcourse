classdef Banco < handle
    properties
        status = 'aberto';
        cash = 0;
        clientes = [];
        nome
        risco
        rwa = 0;
        creditos_devidos = 0;
        creditos_a_receber = 0;
        credito_permitido
    end
    properties
        ListenerDeBanco
    end
    properties (Dependent)
        IB
    end
    events
        creditoSolicitado
    end
    methods
        function obj = Banco(n, r)
            obj.nome = n;
            obj.risco = r;
            obj.ListenerDeBanco = BancoCentral.getInstance.adicionarIF(obj);
        end
        
        function ib = get.IB(obj)
            ib = obj.rwa/obj.creditos_a_receber;
        end
        
        function lh = adicionarCorrentista(obj, corr)
            if strcmp(obj.status, 'aberto')
                obj.clientes = [obj.clientes corr];
                lh = addlistener(corr, 'SaldoInsuficiente', @(src, ~)obj.atribuirStatus(src));
            else
                disp(['O banco ' obj.nome ' foi fechado.'])
            end
        end
        
        function adicionarCash(obj, c)
            if strcmp(obj.status, 'aberto')
                obj.cash = obj.cash + c;
                obj.rwa = obj.rwa + c;
            else
                disp(['O banco ' obj.nome ' foi fechado.'])
            end
        end
        
        function concederCredito(obj, receptor, valor)
            if strcmp(obj.status, 'aberto')
                data.valor = valor;
                data.nome = receptor.nome;
                switch class(receptor)
                    case 'Correntista'
                        obj.creditos_a_receber = obj.creditos_a_receber + valor;
                        receptor.creditos_devidos = receptor.creditos_devidos + valor;
                    case 'Banco'
                        switch receptor.risco
                            case {'AAA','AA+','AA-'}
                                fator = 0.20;
                            case {'A+','A-', 'BBB+', 'BBB-'}
                                fator = 0.5;
                            otherwise
                                fator = 1;
                        end
                        obj.rwa = obj.rwa + valor*fator;
                        receptor.creditos_devidos = receptor.creditos_devidos + valor;
                        obj.creditos_a_receber = obj.creditos_a_receber + valor;
                    otherwise
                        error('Insira um objeto receptor do crédito do tipo Correntista ou Banco.')
                end
                notify(obj, 'creditoSolicitado');
            else
                disp(['O banco ' obj.nome ' foi fechado.'])
            end
        end
    end
    
    methods (Static)
        function atribuirStatus(corr)
            if corr.saldo < 0
                if corr.saldo < -200
                    corr.status = 'fechada';
                else
                    corr.status = 'cheque especial';
                end
            end
        end
    end
end