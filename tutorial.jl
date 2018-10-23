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

#Parallel computing
