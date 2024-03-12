classdef Circulo
    properties
        Raio
    end
    properties (Dependent)
        Area
        Perimetro
    end
    properties (Dependent, Hidden)
        raio_nome_antigo
    end
    properties (Constant, Hidden)
        PrecoDoMetroDeCerca = 20;
    end
    methods
        function obj = Circulo(r)
            obj.Raio = r;
        end
        
        function obj = set.Raio(obj, val)
            if val >= 0
                obj.Raio = val;
            else
                warning('O raio de um círculo tem que ser maior que zero!')
            end
        end
        
        function obj = set.raio_nome_antigo(obj, val)
            obj.Raio = val;
        end
        
        function r = get.raio_nome_antigo(obj)
            r = obj.Raio;
        end
        
        function area = get.Area(obj)
            area = pi*(obj.Raio)^2;
        end
        
        function perimetro = get.Perimetro(obj)
            perimetro = 2*pi*(obj.Raio);
        end
        
        function calcularPrecoDaCerca(obj)
            disp(['Uma cerca com ' num2str(obj.Perimetro) ' m de perímetro custará R$ ' num2str(round(obj.Perimetro * obj.PrecoDoMetroDeCerca,2)) ' reais.'])
        end
    end
end