classdef (Abstract) Ativo < handle & matlab.mixin.Heterogeneous
    % Esta classe descreve um ativo de um portf�lio.
    
    properties (Abstract)
        valor
    end
    
    methods (Abstract)
        atualizarPreco(obj)
    end
    
end

