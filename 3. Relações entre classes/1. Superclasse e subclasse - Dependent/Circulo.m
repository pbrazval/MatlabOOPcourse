classdef Circulo < Forma 
    properties
        raio
    end
    
    methods
        function obj = Circulo(r)
            obj.raio = r;
            obj.perimetro = 2*pi*r;
            obj.area = pi*r^2;
        end
    end
end