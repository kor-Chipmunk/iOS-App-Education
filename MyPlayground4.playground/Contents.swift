//: Playground - noun: a place where people can play

import UIKit

struct TODOList {
    var TODOItems:[TODOItem]
    
    mutating func pushTODOItem(_ item: TODOItem) {
        self.TODOItems.append(item)
    }
    
    mutating func popTODOItem(_ index:Int = -1) -> TODOItem? {
        if index == -1 {
            if let element = self.TODOItems.popLast() {
                return element
            }
            else {
                return nil
            }
        }
        else {
            return self.TODOItems.remove(at: index)
        }
    }
    
    func getHomeTODOList() -> [TODOItem] {
        var HomeTODOList:[TODOItem] = []
        
        for TODOItem in TODOItems {
            if !TODOItem.isDueDate() {
                HomeTODOList.append(TODOItem)
            }
        }
        
        return HomeTODOList
    }
}

struct TODOItem {
    typealias Duration = (start: Date, end: Date)
    
    var title: String
    var memo: String?
    
    var checked: Bool
    var priority: Bool
    
    var dueDate: Duration = (Date(), Date().addingTimeInterval(1000))
    
    var iteratedType:IteratedDayType
    enum IteratedDayType {
        case everyday, days
    }
    
    var iteratedDays:[Days] = []
    enum Days: Int {
        case SUNDAY, MONDAY, THUESDAY, WEDNESDAY, THURSDAY, FRIDAY, SATURDAY
    }
    
    mutating func pushIteratedDay(day: Days) {
        if self.iteratedDays.contains(day) {
            return
        }
        self.iteratedDays.append(day)
    }
    
    mutating func popIteratedDay(day: Days) {
        for iteratedDay in iteratedDays.reversed() {
            if iteratedDay == day {
                if let index = iteratedDays.index(of: iteratedDay) {
                    iteratedDays.remove(at: index)
                }
            }
        }
    }
    
    func isDueDate() -> Bool {
        return Date() > dueDate.end
    }
    
    func isIteratedDays() -> Bool {
        let dateComponets = Calendar.current.dateComponents([.weekday], from: Date())
        
        if let week = dateComponets.weekday {
            for iteratedDay in iteratedDays {
                if iteratedDay.rawValue == week {
                    return true
                }
            }
        }
        return false
    }
}

struct ReminderList {
    
}

struct ReminderItem {
    
}
