classdef Pais
    %PAIS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        A
        K
        L
        modelo
    end
    
    properties (Dependent)
        PIB
    end
    
    methods

        function val = get.PIB(obj)
            val = obj.modelo.projetarPIB(obj);
        end
    end
    
end

