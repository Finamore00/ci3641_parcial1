import Foundation

/*
Clase representando un bloque de memoria

Miembros:
 - size: Tamaño del bloque
 - start: Dirección de inicio del bloque
 - end: Dirección de culminación del bloque
*/

public class Block: Equatable {
    var size: Int
    var start: Int
    var parent: Block?
    var buddy: Block?

    public static func == (lb: Block, rb: Block) -> Bool {
        return lb.start == rb.start
    }

    public init(si: Int, st: Int) {
        self.size = si
        self.start = st
    }

    public func split() -> (Block, Block) {
        let lb = Block(si: self.size/2, st: self.start)
        let rb = Block(si: self.size/2, st: self.start + self.size/2)
        lb.parent = self
        rb.parent = self
        lb.buddy = rb
        rb.buddy = lb

        return (lb, rb)
    }
}


/*
Clase representando la asociación entre un nombre y una subregión de memoria

Miembros:
    - name: String con el nombre de la variable
    - block: Block opcional que contien el bloque de memoria asignado a la variable.
    Si la variable no tiene memoria asignada es nil.

Métodos:
    - getBlock(): Obtener el bloque actualmente asociado al nombre
    - setBlock(): Asigna un bloque al nombre.
*/
public class Variable: Hashable {
    public var name: String
    var block: Block?

    public init(n: String) {
        self.name = n
        self.block = nil
    }

    public static func == (lv: Variable, rv: Variable) -> Bool {
        return lv.name == rv.name
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(self.name)
    }

    public func setBlock(b: Block) {
        self.block = b
    }

    public func getBlock() -> Block? {
        return self.block
    }
}


/*
Clase que implementa la lista de listas de bloques libres.

Miembros:
    - table: Arreglo de arreglos de bloques. El arreglo en el indice
    i de table contendrá los bloques de tamaño 2^i

Métodos:
    - getBlock(size): Recibe el tamaño del bloque deseado y retorna un bloque
    de tamaño size. Si no es posible crear un bloque de tamaño size dado la dis-
    tribución actual de memoria entonces retorna nil.
    - returnBlock(b): Recibe un bloque cuya memoria está siendo liberada y lo reincor-
    pora a su lista correspondiente. Si el buddy del bloque liberado también está libre
    se encarga además de unificar ambos buddies y reubicarlos en la lista correspondiente.
    - printTableStatus(): Imprime el estado actual de la tabla. Indicando cuántos bloques
    libres hay en cada lista.
*/
public class blockRefTable {
    var table: Array<Array<Block>>

    public init(size: Int) {
        table = Array(repeating: [], count: size+1)
        table[size].append(Block(si: Int(pow(2.0, Double(size))), st: 0)) //Se inicializa la tabla con un bloque de tamano 2^n
    }

    public func getBlock(size: Int) -> Block? {
        let index = Int(log2(Double(size)))
        if index > table.count-1 {
            return nil
        }
        if table[index].count != 0 {
            return table[index].removeLast()
        } else {
            let parentBlock = getBlock(size: size*2)
            if parentBlock == nil {
                return nil
            }
            let (retBlock, leftOver) = parentBlock!.split()
            table[index].append(leftOver)
            return retBlock
        }
    }

    public func returnBlock(b: Block) {
        let index = Int(log2(Double(b.size)))
        if b.buddy == nil {
            table[index].append(b)
        } else {
            let buddyPos = table[index].firstIndex(of: b.buddy!)

            if buddyPos == nil {
                table[index].append(b)
            } else {
                table[index].remove(at: buddyPos!)
                returnBlock(b: b.parent!)
            }
        }
    }

    public func printTableStatus() {
        print("ESTADO ACTUAL DE LA TABLA DE BLOQUES LIBRES")
        for i in 0 ..< table.count {
            print(" Hay \(table[i].count) bloques libres de tamaño \(Int(pow(2.0, Double(i))))")
        }
    }
}