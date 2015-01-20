cdef class SinOfSquareFunction(Function):
    cpdef double evaluate(self, double x) except *:
        return sin(x**2)

cdef inline int something_fast(int a, int b):
    return a*a + b

cdef double f(double x):
    return sin(x**2)

cdef class MyType:
    cdef int field
