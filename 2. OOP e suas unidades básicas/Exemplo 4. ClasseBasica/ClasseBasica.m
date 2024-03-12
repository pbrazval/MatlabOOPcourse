classdef ClasseBasica
    % Classe simples que armazena um valor e faz operações
    % elementares com o mesmo.
    
    properties
        Valor
    end
    
    methods
        function r = arredondar(obj)
            r = round([obj.Valor],2);
        end
        function r = multiplicarPor(obj, n)
            r = [obj.Valor]*n;
        end
    end
    
end

