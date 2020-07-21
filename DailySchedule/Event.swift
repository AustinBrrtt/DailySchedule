//
//  Event.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import SwiftUI

enum ToFor {
    case to
    case theWordFor
}

struct Event: Identifiable, Equatable {
    let id = UUID()
    var title: String
    var color: Color
    var rawStart: Float16
    var icon: String
    var toFor: ToFor
    
    var start: Float16 {
        get {
            rawStart < 24 ? rawStart : rawStart - 24
        }
        set {
            rawStart = newValue
        }
    }
    
    init(title: String, color: Color, start: Float16, icon: String, use toFor: ToFor = .theWordFor) {
        self.title = title
        self.color = color
        self.rawStart = start
        self.icon = icon
        self.toFor = toFor
    }
    
    var timeString: String {
        let hour = Int((start >= 13 ? start - 12 : start < 1 ? 12 : start).rounded(.down))
        let pm = start >= 12
        let minute = Int(((start - start.rounded(.down)) * 60).rounded(.down))
        return "\(hour):\(minute < 10 ? "0" : "")\(minute) \(pm ? "PM" : "AM")"
    }
    
    var todayDate: Date {
        let hour = Int(start.rounded(.down))
        let minute = Int(((start - start.rounded(.down)) * 60).rounded(.down))
        let direction: Calendar.SearchDirection = hourFor(date: Date()) < start ? .forward : .backward
        
        return Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: Date(), direction: direction)!
    }
    
    var tomorrowDate: Date {
        let tomorrow = Date().addingTimeInterval(86400)
        let hour = Int(start.rounded(.down))
        let minute = Int(((start - start.rounded(.down)) * 60).rounded(.down))
        let direction: Calendar.SearchDirection = hourFor(date: tomorrow) < start ? .forward : .backward
        
        return Calendar.current.date(bySettingHour: hour, minute: minute, second: 0, of: tomorrow, direction: direction)!
    }
    
    var dateComponents: DateComponents {
        var components = DateComponents()
        components.hour = Int(start.rounded(.down))
        components.minute = Int(((start - start.rounded(.down)) * 60).rounded(.down))
        return components
    }
    
    var safeIdentifier: String {
        title.replacingOccurrences( of:"[^0-9a-zA-Z]", with: "", options: .regularExpression)
    }
    
    private func hourFor(date: Date) -> Float16 {
        let hour = Float16(Calendar.current.component(.hour, from: Date()))
        let minute = Float16(Calendar.current.component(.minute, from: Date()))
        return hour + (minute / 60.0)
    }
}
