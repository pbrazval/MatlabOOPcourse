function fib = fibonacci(numero_de_elementos)
fib = zeros(1,10);
for i = 1:1:numero_de_elementos
    if i == 1 || i == 2
        fib(1, i) = 1;
    else
        fib(1, i) = fib(1, i-1) + fib(1, i-2);
    end
end
end