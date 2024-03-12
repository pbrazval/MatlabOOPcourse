classdef Acao < Ativo
    properties
        sigla
        preco
        media = 0;
        variancia = 0;
    end
    properties (Dependent)
        valor;
    end
    methods
        function obj = Acao(sigla, preco)
            if nargin > 0
                obj.sigla = sigla;
                obj.preco = preco;
            end
        end
        
        function val = get.valor(obj)
            val = obj.preco;
        end
        
        function atualizarPreco(obj)
            obj.preco = obj.preco.*(1+ obj.media + obj.variancia.*randn(1));
            obj.mostrarNovoPreco;
        end
        
        function mostrarNovoPreco(obj)
            disp(['O novo preço da ação ' obj.sigla ' é R$' num2str(round(obj.preco,2)) '.'])
        end
    end
end