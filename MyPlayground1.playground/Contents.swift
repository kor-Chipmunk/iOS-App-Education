//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var num = 100
var i = 0;

//let jin = ["name" : "진겸","department" : "컴퓨터공학과","Grade" : "3학년"]
//let chae = ["name" : "채병훈","department":"컴퓨터공학과","Grade" : "3학년"]



struct Student {
    let name:String
    var depart:String
    var degree:Int
    
    
    func isScholarship(grade:Float) -> Bool{
        
        return true;
    }
}

let jin = Student(name : "진겸",depart : "컴퓨터공학과",degree : 3)
let chae = Student(name : "채병훈",depart : "컴퓨터공학과",degree : 3)

