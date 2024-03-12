classdef (HandleCompatible) Lugar
    properties (Abstract)
        PIB
        C
        G
        I
        X
        M
    end
    
    methods (Abstract)
        projetar(obj);
    end
end