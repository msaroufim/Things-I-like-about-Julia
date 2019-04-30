#Operators are functions
+(1,2,3) == 1 + 2 +3
#Have built in support for complex numbers
#Type(value) casts a value to a certain type
map(round, [1.2, 3.5, 1.7])


#CAn replace try catch block by return an optional nil
function Date(y::Int64, m::Int64=1, d::Int64=1)
    err = validargs(Date, y, m, d)
    err === nothing || throw(err)
    return Date(UTD(totaldays(y, m, d)))
end


#Can do fast vectorized computations using dot notation
A = [1.0, 2.0, 3.0]
sin.(A)

#Consumer producer pattern is very obvious, useful for ML pipelines
function producer(c::Channel)
          put!(c, "start")
          for n=1:4
              put!(c, 2n)
          end
          put!(c, "stop")
end;

#Consumer function
for x in Channel(producer)
    println(x)
end

#Scope is lexical, based on where function is located not based on who called it
#REPL is a scope called Main
# let keyword introduces itws own scope

#Functions are seperate from their objects because of dynamic dispatching
struct Foo
           bar
           baz::Int
           qux::Float64
end

fieldnames(Foo)

#Parametric types are generalized containers. T can be any type

struct Point{T}
           x::T
           y::T
       end

Point{String}("a","b")


struct Rational{T<:Integer} <: Real
    num::T
    den::T
end

#Types are objects in Julia so can run fun ctions on them
isa(1, Int)
typeof(Int)
typeof(DataType)


struct Polar{T<:Real} <: Number
    r::T
    theta::T
end

methods(+)

#Are functions as first class objects really feasible for systems?
#multiple dispatching seems really nice

#Julia code is represented as julia datastructures
ex1 = Meta.parse("1+1")
dump(ex1)

#Matrix concatenation is easy
[[1; 2]; [3, 4]]

[[1 2] [3 4]]

[[1 2]; [3 4]]

#Multi dimensional array indexing is trivial
X = A[I_1, I_2, ..., I_n]

#Any function can be applied on each element of an array (broadcasting) using the @. notation
julia> x = 1.0:3.0; y = similar(x);
@. y = x + 3 * sin(x) 
# 3-element Array{Float64,1}:
#  3.5244129544236893
#  4.727892280477045
#  3.4233600241796016


# Julia has a convention of appending ! to the name of functions that modify their arguments (functions that mutate state)


# Code can be data like in Lisp
ex = quote
    x = 1
    y = 2
    x + y
end

#Creating a server is simple
#so is async programming
using Sockets

@async begin
    server = listen(2000)
    while true
        sock = accept(server)
        @async while isopen(sock)
                 write(sock, readline(sock, keep=true))
    end
end

# Packages like latexify let you
# print in latex, expressions and matrices
# output can be markdown, pdf etc..
# If I'm working with scientific code I can have my scientific code right next to its math equation without having to write the math equation
# Also helps you spot bugs in your code caues you'll see the equation printed for what's actually running!!

# Performance tips
# 1. Have no global variables
2. 


# Parallel programming
# https://docs.julialang.org/en/v1/manual/parallel-computing/

# 1. Create a channel to produce jobs
# 2. Channel to consume jobs
# 3. Make the consumer and sender  both send and solve jobs async
# 4. Log how long the computation took 

# Julia has support for multithreading and uses ```Atomic``` to avoid race condition

# It's possible to call Julia from other languages such as 
jl_function_t *func = jl_get_function(jl_base_module, "sqrt");
jl_value_t *argument = jl_box_float64(2.0);
jl_value_t *ret = jl_call1(func, argument);

jl_value_t *jl_call(jl_function_t *f, jl_value_t **args, int32_t nargs);


## Interesting links
# https://www.youtube.com/watch?v=wpV0Nz-93Hk
# http://courses.csail.mit.edu/18.337/2018/