//
//  Day.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import Foundation

struct Day {
    static var currentWeekday: Int {
        Calendar.current.component(.weekday, from: Date()) - 1
    }
    
    var events: [Event] = []
    
    var eventsPairwise: [(Event, Event)] {
        var pairs: [(Event, Event)] = [(events[events.count - 1], events[0])]
        for i in 0 ..< events.count - 1 {
            pairs.append((events[i], events[i + 1]))
        }
        return pairs
    }
    
    // Assumes there are events since they are currently hardcoded
    // If configurability is added, this needs to be optional
    func currentEvent(_ date: Date = Date()) -> Event {
        let now = hourFor(date: date)
        if now < events[0].start || now >= events[events.count - 1].rawStart {
            return events[events.count - 1]
        }
        
        for (event, nextEvent) in eventsPairwise {
            if now >= event.start && now < nextEvent.start {
                return event
            }
        }
        
        return events[0] // Shouldn't ever happen, but would currenly manifest as defaulting to sleep.
    }
    
    func upNext(_ date: Date = Date()) -> Event {
        let index = events.firstIndex(of: currentEvent(date))! + 1
        return events[index < events.count ? index : 0]
    }
    
    func timeUntilNextChange() -> Int {
        let diff = Int((upNext().start + 24 - hourFor(date: Date())).remainder(dividingBy: 24))
        return (diff * 3600) + 1
    }
    
    private func hourFor(date: Date) -> Float16 {
        let hour = Float16(Calendar.current.component(.hour, from: Date()))
        let minute = Float16(Calendar.current.component(.minute, from: Date()))
        return hour + (minute / 60.0)
    }
}
