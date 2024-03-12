classdef (Abstract) Forma
   properties 
   end
   
   methods (Abstract)
       val = calcularPerimetro(obj);
       val = calcularArea(obj);
       disp(obj);
   end
end