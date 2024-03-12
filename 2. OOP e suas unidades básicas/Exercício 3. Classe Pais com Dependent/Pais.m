classdef Pais 
    properties
        Datas
        PIB
        C
        G
        I
        X
        M
    end
    
    properties (Dependent)
        A
        Erro
        NX
    end
    
    properties (Dependent, Hidden)
        C_nome_antigo
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
        
        function val = get.A(obj)
            val = obj.C + obj.G + obj.I;
        end
        
        function val = get.NX(obj)
            val = obj.X - obj.M;
        end
        
        function val = get.Erro(obj)
            val = obj.PIB - (obj.C + obj.G + obj.I + obj.NX);
        end
        
        function obj = set.C_nome_antigo(obj, val)
            obj.C = val;
        end
    end
end