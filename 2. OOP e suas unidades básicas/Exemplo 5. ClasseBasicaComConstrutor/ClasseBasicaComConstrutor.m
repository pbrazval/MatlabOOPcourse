classdef ClasseBasicaComConstrutor
    %Classe Básica com Construtor
    %   Essa classe mostra um exemplo de um construtor, que permite criar
    %   um objeto de uma determinada classe já com algumas de suas
    %   propriedades inicializadas.
    properties
        Valor
    end
    
    methods
        function obj = ClasseBasicaComConstrutor(nargin)
            if nargin == 0
            else if nargin == 1
                    if isnumeric(val)
                        obj.Valor = val;
                    else
                        error('Valor deve ser um número!')
                    end
                end
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

