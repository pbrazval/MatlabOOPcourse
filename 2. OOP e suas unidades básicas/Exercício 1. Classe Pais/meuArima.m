classdef meuArima < Modelo
    properties
        Mdl
    end
    
    methods
        function obj = meuArima(ar, int, ma)
            obj.Mdl = arima(ar, int, ma);
        end
        
        function series_out = projetar(obj, series, num_periodos)
            modelo_estimado = estimate(obj.Mdl, series);
            series_out = forecast(modelo_estimado, num_periodos, 'Y0', series);
        end
    end
end