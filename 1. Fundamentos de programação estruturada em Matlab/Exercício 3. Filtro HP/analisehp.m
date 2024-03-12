function varargout = analisehp(pib, lambda)

if ~isnumeric(lambda)
    error('Insira lambda numérico');
end

if nargout ==1
    varargout{1} = hpfilter(pib, lambda);
else if nargout == 2
        [varargout{1},varargout{2}]  = hpfilter(pib, lambda);
    end
end
end