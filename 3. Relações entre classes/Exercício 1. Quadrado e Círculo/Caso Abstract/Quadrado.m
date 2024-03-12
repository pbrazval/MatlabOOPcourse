classdef Quadrado < Forma
    properties
        lado
    end
    
    methods
        function obj = Quadrado(l)
            obj.lado = l;
        end
        
        function val = calcularArea(obj)
            val = obj.lado^2;
        end
        
        function obj = calcularPerimetro(obj)
            val = 4*obj.lado;
        end
    end
end