

def bisection(f, interval, min_error=0.001, max_iter=10):

    a = interval[0]
    b = interval[1]

    searching = True

    fa = f(a)
    fb = f(b)

    if fa * fb > 0:
        raise Exception("Invalid iterval")

    iterations = 0    
    while searching and iterations <= max_iter:

        r = a + (b - a) * 0.5

        fr = f(r)

        if abs(fr) < min_error:
            return r

        if fr * fa < 0:
            b = r
            fb = fr
        else:
            a = r
            fa = fr

        iterations = iterations + 1


def regula_falsi(f, interval, min_error=0.001, max_iter=10):

    a = interval[0]
    b = interval[1]

    searching = True

    fa = f(a)
    fb = f(b)

    if fa * fb > 0:
        raise Exception("Invalid iterval")

    iterations = 0    
    while searching and iterations <= max_iter:


        m = (fa - fb) / (a - b)
        r = a - fa / m

        fr = f(r)

        if abs(fr) < min_error:
            return r

        if fr * fa < 0:
            b = r
            fb = fr
        else:
            a = r
            fa = fr

        iterations = iterations + 1


def secant(f, interval, min_error=0.001, max_iter=10):

    a = interval[0]
    b = interval[1]

    searching = True

    fa = f(a)
    fb = f(b)

    if fa * fb < 0:
        raise Exception("Invalid iterval, the values should have the same sign")

    iterations = 0    
    while searching and iterations <= max_iter:


        m = (fa - fb) / (a - b)
        r = a - fa / m

        fr = f(r)

        if abs(fr) < min_error:
            return r
        
        b = a
        fb = fa

        a = r
        fa = fr

        iterations = iterations + 1


def newton_raphson(f, derivate, interval, min_error=0.001, max_iter=10):

    a = interval[0]
    searching = True

    fa = f(a)

    iterations = 0    
    while searching and iterations <= max_iter:

        m = derivate(a)
        r = a - fa / m

        fr = f(r)

        if abs(fr) < min_error:
            return r

        a = r
        fa = fr

        iterations = iterations + 1

