function newton(f::Function, dxf::Function, x0::Number, args::Tuple=();
                        toleranciaEpsilon::AbstractFloat=1e-8, 
                        maxIteracion::Integer=50, epsilon::AbstractFloat=1e-10)
    for i=1:maxIteracion
        yPrima = dxf(x0, args...)
        if abs(yPrima) < epsilon
            error("La primer derivada es cero.")
        end
        
        y = f(x0, args...)
        x = x0 - y/yPrima   # Calculamos xi.
        
        # El procedimiento fue completado satisfactoriamente.
        if abs(x - x0) < toleranciaEpsilon
            numIteracion = string(i)
            println("Requirió $numIteracion iteraciones.")
            return x
        end
        
        x0 = x  # Redefinimos a x0.
    end
    
    error("El número de iteraciones fue excedido.")
end

# Código para correr la aplicación.
entrada = newton(x -> x^3-x-1, x -> 3x^2-1, 1)
resultado = string(entrada)
println("El resultado es: $resultado")