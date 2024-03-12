classdef (Sealed) BancoCentral < handle
    properties
        Bancos = [];
        IB = 0.11;
    end
    
    methods (Access = private)
        function obj = BancoCentral
        end
    end
    
    methods 
        function lb = adicionarIF(obj, bco)
            obj.Bancos = [obj.Bancos bco];
            lb = addlistener(bco, 'creditoSolicitado', @(src, ~) obj.avaliarIB(src));
        end
        
        function avaliarIB(obj, bco)
            if bco.IB > obj.IB
                disp(['O índice de Basileia atual do Banco ' bco.nome 'é de ' num2str(bco.IB) '. O banco continua aberto.']);
                bco.status = 'aberto';
            else
                disp(['O índice de Basileia atual do Banco ' bco.nome 'é de ' num2str(bco.IB) '. Esse banco irresponsável será fechado imediatamente!'])
                bco.status = 'fechado';
            end
        end
    end
    
    methods (Static)
        function singleObj = getInstance
            persistent localObj
            if isempty(localObj) || ~isvalid(localObj)
                localObj = BancoCentral;
            end
            singleObj = localObj;
        end
    end
end