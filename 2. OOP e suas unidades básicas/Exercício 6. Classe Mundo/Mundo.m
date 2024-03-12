classdef Mundo < handle
    %MUNDO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        paises = [];
        importacoes = [];
    end
    
    properties (Dependent)
        PIB
    end
    
    methods
        function adicionarPais(obj, p, imp)
            obj.paises = [obj.paises p];
            obj.importacoes = [obj.importacoes imp];
        end
        
        function val = get.PIB(obj)
            val = [obj.paises.PIB] * [obj.importacoes]'/sum([obj.importacoes]); 
        end
    end
    
end

