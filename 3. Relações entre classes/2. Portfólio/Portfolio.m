classdef Portfolio < Ativo
    properties
        ativos
    end
    
    properties (Dependent)
        valor
    end
    
    methods
        function adicionarAtivo(obj, ativo)
            obj.ativos = [obj.ativos ativo];
        end
        
        function atualizarPreco(obj)
            %obj.ativos.atualizarPreco;
            arrayfun(@(x) atualizarPreco(x), obj.ativos);
            disp(['O valor atual do portfólio é de R$' num2str(obj.valor)]);
        end
        
        function val = get.valor(obj)
            val = sum([obj.ativos.valor]);
        end
    end
end