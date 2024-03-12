function varargout = lerPais(nome_do_pais)

switch nargout
    case 1
        [~, ~, varargout{1}] = xlsread('Dados paises.xlsx', nome_do_pais);
    case 2
        [varargout{2}, ~, varargout{1}] = xlsread('Dados paises.xlsx', nome_do_pais);
    otherwise
        error('A função só permite uma ou duas saídas.')
end

end