import UIKit
/*:
# Playground - Actividad 7
* Valor por tipo y por referencia
* Funciones personalizadas Y Genericos
* Funciones de la biblioteca Swift para Arreglos
*/


/*: 
### Valor por tipo y por referencia
A) Para la colección "var costo_referencia:[Float] = [8.3,10.5,9.9]", aplicar el impuesto del 16% a través de recorrer la colección "costo_referencia" para aplicar el impuesto a cada cantidad, crear una función Impuesto que recibe como parámetro la colección y regrese aplicado el impuesto a cada cantidad.
*/

var costo_referencia:[Float] = [8.3, 10.5, 9.9]
var indice:Int = 0

for i in costo_referencia
{
    costo_referencia[indice] = i*0.16
    indice += 1
}
costo_referencia

func Impuesto(arreglo:[Float]) -> [Float]
{
    var resultado:[Float] = []
    for i in arreglo
    {
        resultado.append(i*0.16)
    }
    return resultado
}
Impuesto(arreglo: costo_referencia)
costo_referencia

//: B) Crear la función "sumaTres"  que reciba una función con dos valores a sumar y un segundo parametro para sumar el tercer número.

let sumar = { (x:Int, y:Int) -> Int
    in return x+y
}

sumar (50, 100)

func sumaTres(a:Int, b:Int, c:Int) -> Int {
    return sumar (a, b) + c
}
sumaTres(a: 50, b: 100, c: 150)

/*:
### Funciones personalizadas y Genéricos

 
 A) Generics: Crear la función genérica para intercambiar valores entre dos variables del mismo tipo.
*/

func intercambiar_String(a:inout String, b:inout String) -> (String, String){
    let temp = a
    a = b
    b = temp
return (a,b)
}

func intercambair_Double(a:inout Double, b:inout Double) -> (Double, Double){
    let temp = a
    a = b
    b = temp
    return (a,b)
}

//: B) Función personalizada: Crear la función "Transformar" que reciba como parámetro una colección de tipo Int  "var datos = [3,7,9,2]" y una función que transforme cada valor de la coleción en una operación definida fuera de la función, regresando una colección transformada.

extension Array
{
    func Transformar<T>(inicial:T, acumula:(T, Element) -> T) -> T {
        var resultado:T = inicial
        for valor in self {
            resultado = acumula(resultado, valor)
        }
        return resultado
    }
}
var datos = [3,7,9,2]
var letras = ["a","b","c","d"]
datos.Transformar(inicial: 0) {(a,b) in a + b}
letras.Transformar(inicial:"" ) {(a,b) in a + b}

/*:
### Biblioteca de Swift
A) Aplicar la función de librería de Swift "map" para la colección var precios = [4.2, 5.3, 8.2, 4.5] y aplicar el impuesto de 16% y asignarla a la variable "impuesto"
*/

var precios = [4.2,5.3,8.2,4.5]

var impuesto = precios.map{a in return a * 0.16 + a}
impuesto

//: B) Aplicar la función de la librería de Swift "filter" para la colección resultante "impuesto" del paso A, en donde se obtengas solo los precios mayores a 6.0 y asignarlos a la variable "precio_menor"

var precio_menor = precios.filter{a in a > 6.0}
precio_menor
