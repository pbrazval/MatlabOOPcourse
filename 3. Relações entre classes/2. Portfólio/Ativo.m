classdef (Abstract) Ativo < handle & matlab.mixin.Heterogeneous
    % Esta classe descreve um ativo de um portfólio.
    
    properties (Abstract)
        valor
    end
    
    methods (Abstract)
        atualizarPreco(obj)
    end
    
end

