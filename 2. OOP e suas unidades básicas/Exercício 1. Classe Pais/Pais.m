classdef Pais < handle & Lugar
    properties
        modelo
        Datas
        PIB
        C
        G
        I
        X
        M
        Erro
    end
    
    properties (Dependent)
        A
        NX
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
        
        function val = get.Erro(obj)
            val = obj.PIB - (obj.C+obj.G+obj.I+obj.NX);
        end
        
        function val = get.NX(obj)
            val = obj.X - obj.M;
        end
        
        function val = get.A(obj)
            val = obj.C + obj.G + obj.I;
        end
        
        function grafPizza(obj)
            componentes = [obj.C(end) obj.G(end) obj.I(end) obj.NX(end)];
            rotulos = {'C', 'G', 'I', 'NX'};
            pie(componentes, rotulos);
        end
        
        function bar(obj)
            x = obj.Datas.Year + obj.Datas.Month/12;
            y = [obj.C obj.G obj.I obj.X -obj.M];
            bar(x,y(:,1:4),'stacked');
            hold on
            bar(x,y(:,5),'stacked', 'r');
            plot(x,obj.PIB, 'LineWidth',1.5);
        end
        
        function projetar(obj, num_periodos)
            campos = {'PIB', 'C', 'G', 'I', 'X', 'M'};
            
            assert(~isempty(obj.modelo),'Preencha modelo antes de continuar!');
            
            for i = 1:1:length(campos)
                obj.(campos{i}) = [obj.(campos{i}); obj.modelo.projetar(obj.(campos{i}), num_periodos)];
            end
                obj.Datas = [obj.Datas; obj.Datas(end)+365.25/4*(1:1:num_periodos)']; 
        end
    end
end