//: Playground - noun: a place where people can play

import UIKit

let names = "Seonjae 💐"

struct Task {
    var title: String          // Stored Property : 메모리 차지
    var time: Int?
    
    var owner: Employee
    // var participant: Employee?
    
    var type:TaskType
    
    enum TaskType {
        case Call(number: String)
        case Report(to: Employee, when: String)
        case Meet(with: Employee, location: String)
        case Support(who: Employee, duration: Int)
        
        var typeTitle:String { // Computed Property : 메모리 차지 X, 계산됨
            get {
                let titleString:String
                switch self {
                case .Call:
                    titleString = "Call"
                case .Report:
                    titleString = "Report"
                case .Meet:
                    titleString = "Meet"
                case .Support:
                    titleString = "Support"
                }
                
                return titleString
            }
        }
    }
    
    init (type: TaskType, owner: Employee) {
        self.type = type;
        self.title = type.typeTitle
        self.owner = owner
        self.time = nil
        // self.participant = nil
    }
    
    init (type: TaskType, owner: Employee, title: String, time: Int?, participant: Employee?) {
        self.init(type: type, owner: owner)
        self.title = title
        self.time = time
        // self.participant = participant
    }
    
    func doBasicTask() -> String {
        let TaskDescription: String
        switch type {
        case .Call(let number):
            TaskDescription = "\(owner.name) make a call to \(number)"
        case .Report(let receiver, let time):
            TaskDescription = "\(owner.name) report to \(receiver.name) at \(time)"
        case .Meet(let participant, let location):
            TaskDescription = "\(owner.name) meet  \(participant.name) at \(location)"
        case .Support(let taskOwner, let duration):
            TaskDescription = "\(owner.name) support \(taskOwner.name) for \(duration) days"
        default:
            TaskDescription = "Need more information for task."
        }
        return TaskDescription
    }
}

class Employee {
    var name:String?
    var phoneNumber:String?
    var boss:Employee?
    
    init (name: String) {
        self.name = name
    }
    
    convenience init (name: String, phone: String) {
        self.init(name: name)
        self.phoneNumber = phone
    }
    
    func report() {
        if let myBoss = boss {
          print("\(self.name) reported to \(myBoss.name)")
        } else {
            print("\(name) don't have boss")
        }
    }
    
    func callTaskToBoss() -> Task? {
        if let myBoss = boss, let callTo = myBoss.phoneNumber {
            var callTask = Task(type: .Call(number: callTo), owner: self)
            return callTask
        }
        return nil
    }
}

var todayTask:[Task] = []

let me:Employee = Employee(name: "Alex", phone: "010-1234-5678")

let toby = Employee(name: "Toby")
toby.phoneNumber = "011-5678-1234"

me.boss = toby
me.report()

// var callTask = Task(title: "Call to Toby", time: 10*60, owner: me, participant: toby, type: .Call)
// var callTask = Task(type: .Report, owner: me)
var reportTask = Task(type: Task.TaskType.Report(to: toby, when: "Afternoon"), owner: me, title: "Report to Boss", time: nil, participant: nil)
todayTask += [reportTask]

if let callTask = me.callTaskToBoss() {
    todayTask += [callTask]
    callTask.doBasicTask()
}

reportTask.doBasicTask()

//var todayTask:[Task] = []
//todayTask += [callTask, reportTask]
//todayTask[1].time = 15*60
//
//callTask.title = "Call to Toby"
//
//print ("today task = \(todayTask), callTask = \(callTask)")
//
//callTask.participant?.phoneNumber = "010-5678-1234"
//print("\(toby.phoneNumber)")
