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

# Flux.ml
https://www.youtube.com/watch?v=R81pmvTP_Ik
* Can use CUDA libraries, numerical code up till a keras like library
* Flux ecosystem can allow exports of models to the browser so can play against alpha go in the browser
* Performance of DL libraries is a compiler problem
* Uses Zygote.jl for AD libary
* It's possible to handtune pytorch and more to get speed up to Julia but the Flux compiler is smarter
* Error messages from inside a TF graph will show the whole stack but with Zygote 
* Wow: Can inspect LLVM code to see what zygote actually does and it's obvious how fast the code can be 