function regla(f::Function, x0::Number, x1::Number, args::Tuple=();
               xTolerancia::AbstractFloat=1e-5, yTolerancia=2eps(Float64),
               maxIteracion::Integer=50)
    y1 = f(x1, args...)
    y0 = f(x0, args...)
    
    for i=1:maxIteracion
        x = x1 - y1 * (x1 - x0)/(y1 - y0)
        
        # x-tolerancia.
        if min(abs(x - x0), abs(x - x1)) < xTolerancia
            numIteraciones = string(i)
            println("Requirió $numIteraciones iteraciones.")
            return x
        end
        
        y = f(x,args...)
        
        # y-tolerancia.
        if abs(y) < yTolerancia
            numIteraciones = string(i)
            println("Requirió $numIteraciones iteraciones.")
            return x
        end
        
        if sign(y0 * y) == 1
            x0 = x
            y0 = y
        else
            x1 = x
            y1 = y
        end
    end
    
    error("Máxima iteración excedida.")
end

# Código para correr la aplicación.
entrada = regla(x -> x^3-x-1, 1, 2)
resultado = string(entrada)
println("El resultado es: $resultado")