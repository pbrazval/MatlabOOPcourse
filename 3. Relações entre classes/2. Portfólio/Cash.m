classdef Cash < Ativo
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        valor
    end
    
    methods
        function obj = Cash(v)
            obj.valor = v;
        end
        
        function atualizarPreco(~)
        end
    end
    
end

