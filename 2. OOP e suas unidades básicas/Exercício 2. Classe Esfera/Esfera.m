classdef Esfera
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    properties (Constant)
        p = 3.1416;
    end
    
    properties
        raio
    end
    
    methods
        function obj = Esfera(r)
            obj.raio = r;
        end
        
        function val = calcularVolume(obj)
            val = 4/3*obj.p*obj.raio^3;
        end
        
        function val = calcularArea(obj)
            val = 4*obj.p*obj.raio^2;
        end
    end
    
end

