classdef ClasseBasicaSemOverload
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Valor
    end
    
    methods
        function obj = ClasseBasicaSemOverload(val)
            if isnumeric(val)
                obj.Valor = val;
            else
                error('Valor deve ser um número!')
            end
        end
        
        function r = arredondar(obj)
            r = round([obj.Valor],2);
        end
        
        function r = multiplicarPor(obj, n)
            r = [obj.Valor]*n;
        end
    end
    
end

