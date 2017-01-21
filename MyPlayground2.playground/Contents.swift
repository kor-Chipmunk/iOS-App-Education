//: Playground - noun: a place where people can play

import UIKit

func addVAT(source: Double) -> Double {
    return source * 1.1
}

func couponDiscount(source: Double) -> Double {
    return source * 0.9
}

var additional:(Double) -> Double

let transaction032701 = 120.7
additional = addVAT
let price032701 = additional(transaction032701)

func finalPrice(source: Double, additional: (Double) -> Double) -> Double {
    let price = additional(source)
    return price
}

let price032702 = finalPrice(source: 350.0, additional: couponDiscount)

// Closure

let addVATClosure = { (source: Double) -> Double in
    return source * 1.1
}

let addVATClosure2 = { source in    // source 타입 추론 가능
    return source * 1.1             // 1.1 때문에 리턴타입 추론 가능
}

let addVATClosure3 = { source in
    source * 1.1                    // return 생략 가능
}

let addVATClosure4 = { $0 * 1.1 }   // 0번째 위치 : $0 으로 축약

let couponDiscountClosure = { (source: Double) -> Double in
    return source * 0.9
}

let couponDiscountClosure2 = { source in
    return source * 0.9
}

let couponDiscountClosure3 = { source in
    source * 0.9
}

let couponDiscountClosure4 = { $0 * 0.9 }

let price032703 = addVATClosure4(157.6)
let price032704 = couponDiscountClosure4(200.0)

func makeAdder (_ x: Int) -> (Int) -> Int {
    func adder(a: Int) -> Int {
        return x + a
    }
    
    return adder
}

func makeAdder2 (_ x: Int) -> (Int) -> Int {
    let adder:(Int) -> Int = {
        return $0 + x
    }
    
    return adder
}

func makeAdder3 (_ x: Int) -> (Int) -> Int {
    return {
        return $0 + x
    }
}

let add5 = makeAdder3(5)         // 함수!
let add10 = makeAdder3(10)       // 함수!

print (add5(2))
print (add10(2))

print(makeAdder3(5)(2))

// Map

let transactions = [560.0, 321.5, 190.0, 672.8, 1190.0, 450.0]

let _addVAT = { $0 * 1.1 }

var vatPrices:[Double] = []

for transaction in transactions {
    vatPrices += [_addVAT(transaction)]
}

let vatMapPrices = transactions.map({ transaction -> Double in
    return transaction * 1.1
})

let vatMapPrices2 = transactions.map({ $0 * 1.1 })


// filter

var bigTransactions: [Double] = []

for price in vatPrices {
    if price >= 500 {
        bigTransactions += [price]
    }
}

let bigFilterTransactions = vatPrices.filter { $0 >= 500 }

var _meetingRooms: [String: Int] = ["Banksy": 4, "Rivera": 8, "Kahlo": 8, "Picasso": 10, "Cezanne": 20, "Matisse": 30]

let members = 9
let available = _meetingRooms.filter( { $0.1 > members } )

print ("\(available[1])")

// sort

func ascendantSort (sort1: Double, sort2: Double) -> Bool {
    return sort1 > sort2
}

let sortedPrices = vatPrices.sorted(by: ascendantSort)
let sortedPrices2 = vatPrices.sorted(by: {sort1, sort2 in
    return sort1 > sort2
})
let sortedPrices3 = vatPrices.sorted(by: { $0 > $1 })
let sortedPrices4 = vatPrices.sorted(by: >)

let sortedMeetingRooms = _meetingRooms.sorted(by: { $0.1 > $1.1 })
print ("\(sortedMeetingRooms)")

// reduce 함수
func priceSum (_ base:Double, adder:Double) -> Double {
    return base + adder
}

var sum:Double = 0.0
for price in vatPrices {
    sum = priceSum(sum, adder: price)
}
print ("\(sum)")

var sum2:Double = 0.0
let sumReduce = vatPrices.reduce(sum2, priceSum)
let sumReduce2 = vatPrices.reduce(sum2, { base, adder in base + adder })
let sumReduce3 = vatPrices.reduce(sum2, +)

let pricesInString = vatPrices.reduce("", { $0 + "\($1)\n" })
let descriptionString = _meetingRooms.reduce("We have meeting rooms : \n", {$0 + "\($1.0) for \($1.1) person \n"})

print (descriptionString)













