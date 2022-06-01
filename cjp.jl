using LinearAlgebra
# X = [3; 4]
# Y = [5; 6]
# X = rand(10,1)

function norma(x)
    return sqrt(x'*x) 
end

function distancia(x,y)
    return norma(y-x)
end

#println(distancia(X, Y))


function normalizar(x)#dado um vator x, devolve um vetor v tal que norma(v) = 1 e direção de v = X
        return x/norma(x)
end

# normalizar -> tirar a norma -> 1


# println(norma(normalizar(X)))


function projetar(y,x) #entrada: dois vetores em R^n; saída: vetor P tal que y é a projeção ortogonal na reta gerada por X
    x_til = normalizar(x);
    lambda = y'*x_til #tamanho da projetação
    return lambda, normalizar(x)*lambda #devolve o vetor projeção
end


# Y = [2;1;3;4]
# X = [200;100;300;400]

# println(projetar(Y,X))

function cosseno(x,y) #entrada: dois vetores; saida: cosseno
    p = projetar(y,x)
    return norma(p)/norma(y)
end

# X=[3;4;5;8]
# Y=[300;400;500;800]

# println(cosseno(X,Y))


# X = [3;2]
# println(cosseno(normalizar(X),X))


function ser_perpendicular(y,x)
    return cosseno(y,x) ≈ 0
end

function mesma_direcao(y,x)
    return cosseno(y,x) ≈ 1    
end

function direcao_oposta(y,x)
    return cosseno(y,x) ≈ -1
end

function fatoracao(a1,a2) #dado a1,a2; retorne que
    q1 = normalizar(a1)
    p = projetar(a2,q1)
    dif = a2-p
    q2 = normalizar(dif)
    return q1,q2
end

a1 = [3;4]
a2 = [6;7]

q1,q2= fatoracao(a1,a2)

println(q1,q2)
