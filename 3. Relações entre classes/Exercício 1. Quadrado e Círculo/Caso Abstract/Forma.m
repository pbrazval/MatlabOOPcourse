classdef (Abstract) Forma < handle
   properties
       area
       perimetro
   end
   
   methods
       function atribuirValores(obj)
           obj.perimetro = obj.calcularPerimetro;
           obj.area = obj.calcularArea;
       end
   end
   
   methods (Abstract)
       val = calcularPerimetro(obj);
       val = calcularArea(obj);
       disp(obj);
   end
end