# Things I like about julia



[tutorial.jl](tutorial.jl)

# Performance tips
https://docs.julialang.org/en/v1.0.0/manual/performance-tips/
1. Have no global variables
2. Add types ot function definitions to have smaller structs
3. Add types to containers
4. Avoid passing variable number of arguments to a function
5. Avoid changing the type of a vriable
6. Seperate structure setup and computation. Compiler knows what the types for computations become and can become faster
7. Pre allocation data structures in functions would speed things up (I'm not sure this is always true)
8. use @. is faster than alternatives for vectorized operations
9. Arrays should be read and  written contiguously for significant speedups