import UIKit

// 1
//#1: 총 예약수를 구하라
/*
let dailyReservation = [6, 5, 4, 7, 8]

var totalReservation : Int
totalReservation = 0
for item in dailyReservation {
    totalReservation = totalReservation + item
}
*/

let dailyReservation = [6, 5, 4, 7, 8]
var totalReservation : Int
totalReservation = dailyReservation.reduce(0, { $0 + $1 })
print (totalReservation)

// 2
/*
//#2: 평균 occupancy를 구하라
let dailyOccupancy = [0.7, 0.7, 0.5, 0.4, 0.9]

var averageOccupancy : Double
averageOccupancy = 0
for item in dailyOccupancy {
    averageOccupancy = averageOccupancy + item/5
}
*/
let dailyOccupancy = [0.7, 0.7, 0.5, 0.4, 0.9]
let averageOccupancy = dailyOccupancy.reduce(0, +) / Double(dailyOccupancy.count)
print(averageOccupancy)

// 3
/*
//#3: 각 번호의 정답률을 구하라 (30문제, 100점 만점, 5지선다)
let outOf30Questions = [3.0, 4.0, 7.0, 6.0, 10.0]

var gotCorrect = [Double]()
for item in outOf30Questions {
    gotCorrect.append(item * 0.3)
}
*/
let outOf30Questions = [3.0, 4.0, 7.0, 6.0, 10.0]
var gotCorrect = [Double]()
var answer = outOf30Questions.map { (item:Double) -> Double in
    return item * 0.3
}
print (answer)

// 4
/*
//#4: 8차 학기 후의 cgpa(학점평균)을 구하라
let gpa = [3.7, 3.5, 4.0, 4.2, 3.2, 4.1, 3.5, 4.0]

var cgpa: Double
cgpa = 0
for item in gpa {
    cgpa = cgpa + item/8
}
*/
let gpa = [3.7, 3.5, 4.0, 4.2, 3.2, 4.1, 3.5, 4.0]
var cgpa: Double
cgpa = gpa.reduce(0, { $0 + $1 / 8 })
print (cgpa)

// 5
/*
//#5: 10보다 큰 수를 더하라
let someNumber = [1, 5, 9, 11, 15, 16]

var largerThanTen: [Int] = []
for item in someNumber {
    if item > 10 {
        largerThanTen.append(item)
    }
}
var sum: Int = 0
for item in largerThanTen {
    sum = sum + item
}
*/
let someNumber = [1, 5, 9, 11, 15, 16]
var sum: Int = someNumber.filter({ $0 > 10 }).reduce(0, { $0 + $1 })
print(sum)