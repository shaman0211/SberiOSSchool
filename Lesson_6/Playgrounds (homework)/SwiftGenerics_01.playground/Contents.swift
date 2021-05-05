import UIKit

// MARK: - Задача 1 "Сделать так, чтобы закомментированный код работал"

func sumTwoValues<T: Summable>(_ a: T, _ b: T) -> T {
	let result = a + b
	return result
}

protocol Summable {
    static func +(lhs: Self, rhs: Self) -> Self
}

extension Int: Summable {}
extension Double: Summable {}
extension String: Summable {}

let a = 25.0
let b = 34.0

let resultDouble = sumTwoValues(a, b)
print(resultDouble)

let c = "ABC"
let d = "DEF"

let resultString = sumTwoValues(c, d)
print(resultString)
