//
//  DayModel.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import Foundation

class DayModel: ObservableObject {
    @Published var days: [Day] = []
    
    var day: Day {
        get { days[Day.currentWeekday] }
        set { days[Day.currentWeekday] = newValue }
    }
    
    init(dinnerTime: Float16 = 19.5) {
        setupEvents(dinnerTime: dinnerTime)
    }
    
    func setupEvents(dinnerTime: Float16 = 19.5) {
        print(dinnerTime)
        var weekdayEvents = [
            Event(title: "Wake Up", color: .yellow, start: 8, icon: "sunrise.fill", use: .to),
            Event(title: "Get Ready & Duolingo", color: .green, start: 8.5, icon: "comb.fill", use: .to),
            Event(title: "Read", color: .betterOrange, start: 9, icon: "book.fill", use: .to),
            Event(title: "Work", color: .red, start: 9.45, icon: "case.fill")
        ]
        switch dinnerTime {
        case 17:
            weekdayEvents += [
                Event(title: "Dinner", color: .betterOrange, start: 17, icon: "largecircle.fill.circle"),
                Event(title: "Learn", color: .purple, start: 17.5, icon: "graduationcap.fill", use: .to),
                Event(title: "Code", color: .betterBlue, start: 18.5, icon: "iphone", use: .to),
                Event(title: "Music", color: .lightGrey, start: 19.5, icon: "pianokeys"),
                Event(title: "Workout & Podcasts", color: .limeGreen, start: 20, icon: "figure.walk.circle.fill")
            ]
        case 17.5:
            weekdayEvents += [
                Event(title: "Learn", color: .purple, start: 17, icon: "graduationcap.fill", use: .to),
                Event(title: "Dinner", color: .betterOrange, start: 17.5, icon: "largecircle.fill.circle"),
                Event(title: "Learn", color: .purple, start: 18, icon: "graduationcap.fill", use: .to),
                Event(title: "Code", color: .betterBlue, start: 18.5, icon: "iphone", use: .to),
                Event(title: "Music", color: .lightGrey, start: 19.5, icon: "pianokeys"),
                Event(title: "Workout & Podcasts", color: .limeGreen, start: 20, icon: "figure.walk.circle.fill")
            ]
        case 18:
            weekdayEvents += [
                Event(title: "Learn", color: .purple, start: 17, icon: "graduationcap.fill", use: .to),
                Event(title: "Dinner", color: .betterOrange, start: 18, icon: "largecircle.fill.circle"),
                Event(title: "Code", color: .betterBlue, start: 18.5, icon: "iphone", use: .to),
                Event(title: "Music", color: .lightGrey, start: 19.5, icon: "pianokeys"),
                Event(title: "Workout & Podcasts", color: .limeGreen, start: 20, icon: "figure.walk.circle.fill")
            ]
        case 18.5:
            weekdayEvents += [
                Event(title: "Learn", color: .purple, start: 17, icon: "graduationcap.fill", use: .to),
                Event(title: "Code", color: .betterBlue, start: 18, icon: "iphone", use: .to),
                Event(title: "Dinner", color: .betterOrange, start: 18.5, icon: "largecircle.fill.circle"),
                Event(title: "Code", color: .betterBlue, start: 19, icon: "iphone", use: .to),
                Event(title: "Music", color: .lightGrey, start: 19.5, icon: "pianokeys"),
                Event(title: "Workout & Podcasts", color: .limeGreen, start: 20, icon: "figure.walk.circle.fill")
            ]
        case 19:
            weekdayEvents += [
                Event(title: "Learn", color: .purple, start: 17, icon: "graduationcap.fill", use: .to),
                Event(title: "Code", color: .betterBlue, start: 18, icon: "iphone", use: .to),
                Event(title: "Dinner", color: .betterOrange, start: 19, icon: "largecircle.fill.circle"),
                Event(title: "Music", color: .lightGrey, start: 19.5, icon: "pianokeys"),
                Event(title: "Workout & Podcasts", color: .limeGreen, start: 20, icon: "figure.walk.circle.fill")
            ]
        case 20:
            weekdayEvents += [
                Event(title: "Learn", color: .purple, start: 17, icon: "graduationcap.fill", use: .to),
                Event(title: "Code", color: .betterBlue, start: 18, icon: "iphone", use: .to),
                Event(title: "Music", color: .lightGrey, start: 19, icon: "pianokeys"),
                Event(title: "Workout & Podcasts", color: .limeGreen, start: 19.5, icon: "figure.walk.circle.fill"),
                Event(title: "Dinner", color: .betterOrange, start: 20, icon: "largecircle.fill.circle"),
                Event(title: "Workout & Podcasts", color: .limeGreen, start: 20.5, icon: "figure.walk.circle.fill")
            ]
        case 20.5:
            weekdayEvents += [
                Event(title: "Learn", color: .purple, start: 17, icon: "graduationcap.fill", use: .to),
                Event(title: "Code", color: .betterBlue, start: 18, icon: "iphone", use: .to),
                Event(title: "Music", color: .lightGrey, start: 19, icon: "pianokeys"),
                Event(title: "Workout & Podcasts", color: .limeGreen, start: 19.5, icon: "figure.walk.circle.fill"),
                Event(title: "Dinner", color: .betterOrange, start: 20.5, icon: "largecircle.fill.circle")
            ]
        default: // 19.5
            weekdayEvents += [
                Event(title: "Learn", color: .purple, start: 17, icon: "graduationcap.fill", use: .to),
                Event(title: "Code", color: .betterBlue, start: 18, icon: "iphone", use: .to),
                Event(title: "Music", color: .lightGrey, start: 19, icon: "pianokeys"),
                Event(title: "Dinner", color: .betterOrange, start: 19.5, icon: "largecircle.fill.circle"),
                Event(title: "Workout & Podcasts", color: .limeGreen, start: 20, icon: "figure.walk.circle.fill")
            ]
        }
        
        weekdayEvents += [
            Event(title: "Free Time", color: .betterPink, start: 21, icon: "tv"),
            Event(title: "Theme System", color: .yellow, start: 23, icon: "text.book.closed.fill"),
            Event(title: "Read", color: .betterOrange, start: 23.1, icon: "book.fill", use: .to),
            Event(title: "Sleep", color: .cyan, start: 24, icon: "bed.double.fill", use: .to) // Allows using 24 to be midnight but at end of day instead of start
        ]
        
        var weekendEvents = weekdayEvents
        weekendEvents[3] = Event(title: "Free Time", color: .betterPink, start: 9.45, icon: "tv") // Replace work
        
        days = [
            Day(dayOfWeek: 1, events: weekendEvents),  // U
            Day(dayOfWeek: 2, events: weekdayEvents),  // M
            Day(dayOfWeek: 3, events: weekdayEvents), // T
            Day(dayOfWeek: 4, events: weekdayEvents),  // W
            Day(dayOfWeek: 5, events: weekdayEvents), // R
            Day(dayOfWeek: 6, events: weekdayEvents),  // F
            Day(dayOfWeek: 7, events: weekendEvents) // S
        ]
    }
    
    func refresh(andPerform action: @escaping () -> Void = {}) {
        objectWillChange.send()
        action()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(day.timeUntilNextChange())) {
            self.refresh(andPerform: action)
        }
    }
}
