//
//  DayModel.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import Foundation

class DayModel: ObservableObject {
    @Published var days: [Day]
    
    var day: Day {
        get { days[Day.currentWeekday] }
        set { days[Day.currentWeekday] = newValue }
    }
    
    init() {
        var day1 = Day()
        day1.events = [
            Event(title: "Wake Up", color: .yellow, start: 8, icon: "sunrise.fill", use: .to),
            Event(title: "Get Ready & Duolingo", color: .green, start: 8.5, icon: "comb.fill", use: .to),
            Event(title: "Read", color: .orange, start: 9, icon: "book.fill", use: .to),
            Event(title: "Work", color: .red, start: 9.45, icon: "case.fill"),
            Event(title: "Music", color: .lightGrey, start: 17, icon: "pianokeys"),
            Event(title: "Prob & Stat", color: .purple, start: 17.5, icon: "die.face.5"),
            Event(title: "Dinner", color: .orange, start: 18.5, icon: "largecircle.fill.circle"),
            Event(title: "iOS Development", color: .betterBlue, start: 19, icon: "iphone"),
            Event(title: "Workout & Podcasts", color: .limeGreen, start: 20, icon: "figure.walk.circle.fill"),
            Event(title: "TV & Video Games", color: .betterPink, start: 21, icon: "tv"),
            Event(title: "Theme System", color: .yellow, start: 23, icon: "text.book.closed.fill"),
            Event(title: "Read", color: .orange, start: 23.1, icon: "book.fill", use: .to),
            Event(title: "Sleep", color: .cyan, start: 24, icon: "bed.double.fill", use: .to) // Allows using 24 to be midnight but at end of day instead of start
        ]
        
        var day2 = day1
        day2.events[5] = Event(title: "Machine Learning", color: .green, start: 17.5, icon: "pc")
        day2.events[7] = Event(title: "Game Development", color: .red, start: 19, icon: "gamecontroller.fill")
        
        var saturday = day2
        saturday.events[3] = Event(title: "Game Development", color: .red, start: 9.45, icon: "gamecontroller.fill") // Replace work
        saturday.events[7] = Event(title: "iOS Development", color: .betterBlue, start: 19, icon: "iphone")
        
        var sunday = saturday
        sunday.events[3] = Event(title: "iOS Development", color: .betterBlue, start: 9.45, icon: "iphone")
        sunday.events[7] = Event(title: "Game Development", color: .red, start: 19, icon: "gamecontroller.fill")
        
        days = [
            sunday,  // U
            day1,    // M
            day2,    // T
            day1,    // W
            day2,    // R
            day1,    // F
            saturday // S
        ]
    }
    
    func refresh() {
        objectWillChange.send()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(day.timeUntilNextChange())) {
            self.refresh()
        }
    }
}
