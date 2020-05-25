from sklearn.datasets import make_moons
import matplotlib.pyplot as plt
import numpy as np 

# Definimos la función logística.
def logistica(z):
    return 1.0 / (1.0 + np.exp(-z))

# Definimos el descenso gradiente.
def gradient_descent(x, y, theta, iterations, alpha, m):
    past_costs = []
    past_thetas = [theta]
    for i in range(iterations):
        prediction = np.dot(x, theta)
        error = prediction - y
        cost = 1/(2*m) * np.dot(error.T, error)
        past_costs.append(cost)
        theta = theta - (alpha * (1/m) * np.dot(x.T, error))
        past_thetas.append(theta)
        
    return past_thetas, past_costs

def main():
    # Generamos un conjunto de datos.
    C1, C2 = make_moons(random_state = 123, n_samples=200, noise=0.1)
    #plt.scatter(C1[:,0], C1[:,1], c=C2); plt.show()
    
    alpha = 0.01 #Step size
    iterations = 2000 #No. of iterations
    m = C2.size #No. of data points
    np.random.seed(123) #Set the seed
    theta = np.random.rand(2) #Pick some random values to start with
    
    past_thetas, past_costs = gradient_descent(C1, C2, theta, iterations, alpha, m)
    theta = past_thetas[-1]

    #Print the results...
    print("Gradient Descent: {:.2f}, {:.2f}".format(theta[0], theta[1]))

if __name__ == "__main__":
    main()