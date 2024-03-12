classdef ClasseBasicaComOverload
    %Esta classe redefine os métodos "plus" (operador "+") e o disp, que
    %são embutidos do Matlab.
    properties
        Valor
    end
    methods
        function obj = ClasseBasicaComOverload(val)
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
        function r = plus(val1, val2)
            r = val1.Valor + val2.Valor;
        end
        function r = disp(obj)
            r = ['Seu objeto contém o valor ' num2str(obj.Valor) '.'];
        end
    end
end

