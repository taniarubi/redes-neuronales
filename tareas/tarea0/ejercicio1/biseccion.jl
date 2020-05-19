function biseccion(f::Function, a::Number, b::Number, 
                   toleranciaEpsilon::AbstractFloat = 1e-5, 
                   maxIteracion::Integer=100)
    fa = f(a)
    fa * f(b) <= 0 || error("No existen raíces reales en [a, b].")
    for i = 1:maxIteracion
        p = (a + b)/2 # El punto medio de [a, b].
        fp = f(p)
        # La raíz se encuentra en la mitad derecha (ó izquierda) de [a, b].
        fp * fa > 0 ? a = p : b = p 

        if (abs(fp) < toleranciaEpsilon) | ((b - a) < toleranciaEpsilon)
            numIteracion = string(i)
            println("Requirió $numIteracion iteraciones.")
            return p
        end
    end
    
    error("El número de iteraciones fue excedido.")
end

# Código para correr la aplicación.
entrada = biseccion(x -> x^3-x-1, 1, 2)
resultado = string(entrada)
println("The resultado es : $resultado")
