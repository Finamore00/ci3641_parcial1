/*
Funciones para el inciso 1.b

Autor: Santiago Finamore
*/

/*
i. Dada una cadena de caracteres w y un entero no negativo k, calcular la rotacion
de k posiciones sobre la cadena w. Utilice la siguiente formula como referencia

rotar(w,k) = 
    | w si k == 0 or |w| = 0
    | rotar(x ++ [a], k-1) si k > 0 and w == ax and a es caracter
*/

public func StringRotate(w: String, k: Int) -> String {
    let r = w.count == 0 ? 0 : k % w.count //Rotaciones efectivas a realizar

    return String(w.suffix(w.count - r) + w.prefix(r)) //Substrings pa todos los lenguajes plox
}

/*
ii. Dada una matrix cuadrada A (Cuya dimension es NxN), calcular el producto de AxA^t 
(donde A^t es la transpuesta de A).

Recordemos que la multiplicacion de dos matrices cuadradas, A y B (de tamaño NxN) viene
dada por la siguiente formula:

(forall i, j | i in [1..N] and j in [1..N]: (AxB)[i][j] = sum(k | k in [1..N] : A[i][k] * B[k][j]))
*/

public func MatrixTimesTransposed(A: [[Int]]) -> [[Int]] {
    //Asumiendo correctitud del input
    let N = A[0].count
    var result: [[Int]] = Array(repeating: Array(repeating: 0, count: N), count: N)

    for i in 0 ..< N {
        for j in 0 ..< N {
            var sum = 0
            for k in 0 ..< N {
                sum += A[i][k] * A[j][k]
            }
            result[i][j] = sum
        }
    }

    return result
}