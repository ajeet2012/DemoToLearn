import UIKit
import Foundation

var str = "Hello, playground"


//############## ------ MAP ------- ###############


let numbers = [2, 5, 3, 9, 15, 12, 8, 17, 20, 11]

//Convert Int array to string array
let numberString = numbers.map { (a) -> String in
   
    return String(a)
    
}

print(numberString)

//Create double of all array element and return new array


//Example - 1
let numberDoubled_1 = numbers.map { (a) -> Int in
        
    return a * 2
    
}
print(numberDoubled_1)



//Example - 2
let numberDoubled_2 = numbers.map { $0 * 2 }
print(numberDoubled_2)



//Example - 3
let numberDoubled_3 = numbers.map { "\($0)$" }
print(numberDoubled_3)


//############## ------ Compact Map ------- ###############


//Any element which resulting in a nil value will be excluded from the updated array.

let coins = ["1", "5", "$", "10", "6"]

//Example - 1

let test = coins.compactMap { t  in
    
    Int(t)
    
}
print(test)

//Example - 2

let validCoinsUsingCompactMap = coins.compactMap { coin in
    Int(coin)
}
print(validCoinsUsingCompactMap)

//Example - 3

let validCoinsUsingCompactMap_shortSyntax = coins.compactMap { Int($0) }
print(validCoinsUsingCompactMap_shortSyntax)

//############## ------ Flat Map ------- ###############

let marks = [[3, 4, 5], [2, 5, 3], [1, 2, 2], [5, 5, 4], [3, 5, 3]]

print(marks)

//Example - 1

let merge = marks.flatMap { (array) -> [Int] in
    
    return array
}

print(merge)

//Example - 2

let merge_2 = marks.flatMap{  $0 }

print(merge_2)


//############## ------ Filter ------- ###############


let arrayFilterSample = [3, 4, 6, 12, 33, 45, 66, 77, 789]

//Show all even numbers ---

//Example - 1

let evenArray = arrayFilterSample.filter { (n) -> Bool in
    
    if n % 2 == 0{
    
        return true
    }
    else{
        return false
    }
    
}

print(evenArray)

//Example - 2

let evenArray_2 = arrayFilterSample.filter { (n) -> Bool in
    
    return n % 2 == 0
    
}

print(evenArray_2)

//Example - 3

let evenArray_3 = arrayFilterSample.filter { $0 % 2 == 0 }

print(evenArray_3)


//############## ------ Reduce ------- ###############


let arrayReduceSample = [3, 4, 6, 12, 33, 45, 66, 77, 7]

//Sum of all array elements ---

//Example - 1

let total = arrayReduceSample.reduce(0) { (result, n) -> Int in
    
    return result + n
}
print(total)
//Example - 2

let total_2 = arrayReduceSample.reduce(0, {$0 + $1})

print(total_2)

//Example - 3

let total_3 = arrayReduceSample.reduce(0, +)

print(total_3)

//############## ------ Sort ------- ###############


var arraySortSample_1 = [3, 4, 6, 12, 33, 45, 66, 77, 7]
var arraySortSample_2 = [3, 4, 6, 12, 33, 45, 66, 77, 7]
//Sum of all array elements ---

//Example - 1

let sortArray = arraySortSample_1.sorted()

print(sortArray)

//Example - 2

arraySortSample_1.sort()

print(arraySortSample_1)


//Example - 3  --- Assending ---

let arraySortAssending = arraySortSample_2.sorted { (a, b) -> Bool in
    return a < b
}

print(arraySortAssending)

//Example - 4  --- Desending ---

let arraySortDecending_1 = arraySortSample_2.sorted { (a, b) -> Bool in
    return a > b
}

print(arraySortDecending_1)

//Example - 5  --- Desending ---

let arraySortDecending_2 = arraySortSample_2.sorted { $0 > $1 }

print(arraySortDecending_2)

//Example - 3  --- Assending ---

let arraySortAssending_2 = arraySortSample_2.sorted { $0 < $1 }

print(arraySortAssending_2)


//############## ------ Contain ------- ###############


var arrayContain = [13, 4, 16, 12, 3, 45, 85, 77, 37]

let divideByThree = arrayContain.contains { (n) -> Bool in
    
    return n % 3 == 0
    
}
print(divideByThree)


//############## ------ Remove all ------- ###############


arrayContain.removeAll { (n) -> Bool in
    
    return n < 10
    
}


print(arrayContain)

arrayContain.removeAll { (n) -> Bool in
    
    return n > 50
    
}


print(arrayContain)

arrayContain.removeAll { $0 > 30 }


print(arrayContain)
