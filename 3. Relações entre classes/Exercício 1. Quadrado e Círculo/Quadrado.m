classdef Quadrado < Forma
    properties
        lado
    end
    
    methods
        function obj = Quadrado(l)
            obj.lado = l;
            obj.perimetro = 4*l;
            obj.area = l^2;
        end
    end
    
end