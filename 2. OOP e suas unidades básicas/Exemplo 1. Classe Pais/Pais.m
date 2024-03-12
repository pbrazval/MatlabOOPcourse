classdef Pais < char
    properties
        Datas
        PIB
        C
        G
        I
        X
        M
    end
    
    methods
        function obj = Pais(table_pais)
            obj.Datas = table_pais.Datas;
            obj.PIB = table_pais.PIB;
            obj.C = table_pais.C;
            obj.G = table_pais.G;
            obj.I = table_pais.I;
            obj.X = table_pais.X;
            obj.M = table_pais.M;
        end
    end
end