classdef (Abstract) Modelo < handle
    properties
    end
    
    methods (Abstract)
%         function estimarArima(obj, ar, int, ma, series)
%             Mdl = arima(ar,int, ma);
%             obj.deleg = estimate(Mdl, series);
%         end
        projetar(obj, series, num_periodos);
    end
end