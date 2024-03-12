classdef ContaBancaria < handle
   properties (Access = ?GerenteDaConta)
      StatusDaConta = 'aberta'
   end
   properties (SetAccess = private)
      NumeroDaConta
      SaldoDaConta
   end
   properties (Transient)
      ListenerDaConta
   end
   events
      SaldoInsuficiente
   end
   methods
      function CB = ContaBancaria(numCon,salInic)
         CB.NumeroDaConta = numCon;
         CB.SaldoDaConta = salInic;
         CB.ListenerDaConta =  GerenteDaConta.adicionarConta(CB);
      end
      function depositar(CB,qtia)
         CB.SaldoDaConta = CB.SaldoDaConta + qtia;
         if CB.SaldoDaConta > 0
            CB.StatusDaConta = 'aberta';
         end
      end
      function sacar(CB,qtia)
         if (strcmp(CB.StatusDaConta,'fechada')&& CB.SaldoDaConta <= 0)
            disp(['A conta ',num2str(CB.NumeroDaConta),' foi fechada.'])
            return
         end
         newbal = CB.SaldoDaConta - qtia;
         CB.SaldoDaConta = newbal;
         if newbal < 0
            notify(CB,'SaldoInsuficiente')
         end
      end
      function getStatement(CB)
         disp('-------------------------')
         disp(['Account: ',num2str(CB.NumeroDaConta)])
         ab = sprintf('%0.2f',CB.SaldoDaConta);
         disp(['CurrentBalance: ',ab])
         disp(['Account Status: ',CB.StatusDaConta])
         disp('-------------------------')
      end
   end
end