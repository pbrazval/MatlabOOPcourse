classdef Mundo < handle & Lugar
    properties
        C
        G
        I
        X
        M
        paises
        ponderacao
    end
    properties (Dependent)
        PIB
    end
    methods
        function obj = Mundo
            if nargin == 0
               obj.paises = [];
               obj.ponderacao = [];
            end
        end
        function adicionarPais(obj, pais, peso)
            obj.paises = [obj.paises pais];
            obj.ponderacao = [obj.ponderacao peso];
        end
        function val = get.PIB(obj)
            val = [obj.paises.PIB]*obj.ponderacao';
        end
        function projetar(obj)
            disp('Oxe, meu filho! Esse método ainda não foi implementado!');
        end
    end
end