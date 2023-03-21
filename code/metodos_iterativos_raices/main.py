import math


class IterativeMethod:

    def __init__(self, function):
        self.function = function

    def setup(self, a, b):
        pass

    def calculate_r(self):
        pass

    def update(self, r, function_r):
        pass


class BisectionMethod(IterativeMethod):


    def __init__(self, function):
        super().__init__(function)
        self.a = None
        self.b = None
        self.function_a = None
        self.function_b = None

    def setup(self, a, b):
        """
        Tests if the input interval is valid
        """
        self.a = a
        self.b = b
        self.function_a = self.function(self.a)
        self.function_b = self.function(self.b)
        return self.function_a * self.function_b < 0
    
    def calculate_r(self):
        self.function_a = self.function(self.a)
        self.function_b = self.function(self.b)
        return self.a + (self.function_b - self.function_a) * 0.5
    
    def update(self, r, function_r):

        if self.function_a * function_r < 0:
            self.function_b = function_r
            self.b = r

        else:
            self.function_a = function_r
            self.a = r 


class RegulaFalsiMethod(BisectionMethod):

    def calculate_r(self):
        slope = (self.function_a - self.function_b) / (self.a - self.b)
        return self.a - self.function_a / slope


class SecantMethod(RegulaFalsiMethod):

    def setup(self, a, b):
        """
        Tests if the input interval is valid, in this case, the points should have the same sign
        """
        self.a = a
        self.b = b
        self.function_a = self.function(self.a)
        self.function_b = self.function(self.b)
        return self.function_a * self.function_b > 0

    def update(self, r, function_r):
        
        self.b = self.a
        self.function_b = self.function_a

        self.a = r
        self.function_a = function_r



class NewtonRaphsonMethod(IterativeMethod):


    def __init__(self, function, derivate):
        super().__init__(function)
        self.derivate = derivate
        self.t = None
        self.function_t = None

    def setup(self, a, b):
        """
        Tests if the input interval is valid
        """
        self.t = a
        self.function_t = self.function(self.t)
        return True
    
    def calculate_r(self):
        slope = self.derivate(self.t)
        return self.t - self.function_t / slope
    
    def update(self, r, function_r):
        self.t = r
        self.function_t = function_r


class IterativeRootSearch:

    def __init__(self):
        self.max_iterations = 10
        self.min_accepted_error = 0.001
        self.method = None

    def search(self, function, interval, derivate_function=None):
        """        
        If the derivate is given, uses the newton raphson method, otherwise
        uses the secan method. 
        """        
        if not derivate_function:
            self.method = SecantMethod(function)
        else:
            self.method = NewtonRaphsonMethod(function, derivate_function)

        # Method specific input error
        if not self.method.setup(interval[0], interval[1]):
            raise Exception("Invalid iterval")

        searching = True
        iterations = 0    

        while searching and iterations <= self.max_iterations:
            
            # Calculates r
            r = self.method.calculate_r()
            fr = function(r)

            # Checks if the fr is close enough to 0
            if abs(fr) < self.min_accepted_error:
                return r

            # Updates the values in the method
            self.method.update(r, fr)
            iterations = iterations + 1



if __name__ == "__main__":

    solver = IterativeRootSearch()

    func = lambda t: .7 + math.cos(t)
    derivate = lambda t: -math.sin(t)

    root = solver.search(func, (4, 4.1), derivate)
    print(root)
        

