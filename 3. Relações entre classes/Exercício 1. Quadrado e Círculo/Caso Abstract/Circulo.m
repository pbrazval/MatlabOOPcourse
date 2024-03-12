classdef Circulo < Forma
    properties
        raio
    end
    
    methods
        function obj = Circulo(r)
            obj.raio = r;
            atribuirValores@Forma(obj);
        end
        
        function val = calcularArea(obj)
            val = pi*obj.raio^2;
        end
        
        function val = calcularPerimetro(obj)
            val = 2*pi*obj.raio;
        end
    end
end