//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

// let maxSpeed = 200  :Int 생략 가능, : 다음엔 타입이 나옴
let maxSpeed:Int = 200

var currentSpeed:Int = 120

print("Max speed is \(maxSpeed)km/h")
print("and current speed is \(currentSpeed)km/h")

// Swift는 let(상수) 권장, var(변수) 지양
// 상수는 문제를 일으키지 않기 때문, 변수 때문에 죽어버리는 경우 많음

currentSpeed = 110
// currentSpeed = 110.5 : Strict Typing! => 타입 구분 엄격
var currentSpeed2:Double = 110.5