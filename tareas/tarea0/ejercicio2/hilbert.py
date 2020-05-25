import numpy as np
import matplotlib.pyplot as plt

## Regresa la n-ésima matriz de Hilbert.
def hilbert(n):
    if n == 1:
        return np.array([[1]])
    else:
        x = np.arange(1, n + 1) + np.arange(0, n)[:, np.newaxis]
    return (1.0/x)

# Regresa una gráfica del número de condición de las primeras 20 matrices de
# Hilbert.
def imprime():
    i = 1
    valores = []
    while i <= 20:
        matriz = hilbert(i)
        # Calculamos el número de condición de la matriz Mi.
        norma = np.linalg.norm(matriz)
        normaInv = np.linalg.norm(np.linalg.inv(matriz))
        y = norma * normaInv
        valores.append(y)
        i = i+1  
        
    print(valores)  
    x = np.arange(20)
    plt.plot(x,valores)
    plt.xlabel('x')
    plt.ylabel('y')
    plt.title("Número de condición")
    plt.show()
        
if __name__ == "__main__":
    imprime()