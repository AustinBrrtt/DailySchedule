//
//  DailyScheduleWidget.swift
//  DailyScheduleWidget
//
//  Created by Austin Barrett on 7/18/20.
//

import WidgetKit
import SwiftUI
import Intents

struct EventProvider: TimelineProvider {
    private let dayModel = DayModel()
    
    func snapshot(with context: Context, completion: @escaping (EventEntry) -> ()) {
        let entry = EventEntry(date: Date(), currentEvent: dayModel.day.currentEvent(Date()), nextEvent: dayModel.day.upNext(Date()))
        completion(entry)
    }
    
    func timeline(with context: Context, completion: @escaping (Timeline<EventEntry>) -> ()) {
        var entries: [EventEntry] = []
        
        let weekDay = Day.currentWeekday
        for (event, next) in dayModel.days[weekDay].eventsPairwise {
            entries.append(Entry(date: event.todayDate, currentEvent: event, nextEvent: next))
        }
        
        let weekDayTomorrow = (weekDay + 1) % 7
        for (event, next) in dayModel.days[weekDayTomorrow].eventsPairwise {
            entries.append(Entry(date: event.tomorrowDate, currentEvent: event, nextEvent: next))
        }
        
        let tomorrow = Calendar.current.date(bySettingHour: 0, minute: 0, second: 0, of: Date().addingTimeInterval(86400), direction: .backward)!
        let timeline = Timeline(entries: entries.sorted(), policy: .after(tomorrow))
        completion(timeline)
    }
    
    typealias Entry = EventEntry
}

struct EventEntry: TimelineEntry, Comparable {
    static func < (lhs: EventEntry, rhs: EventEntry) -> Bool {
        return lhs.date < rhs.date
    }
    
    public static let placeholder = EventEntry(date: Date(), currentEvent: placeholderCurrent, nextEvent: placeholderNext)
    private static let placeholderCurrent = DayModel().day.currentEvent()
    private static let placeholderNext = DayModel().day.upNext()
    
    public let date: Date
    public let currentEvent: Event
    public let nextEvent: Event
}

struct PlaceholderView : View {
    var body: some View {
        Text("Placeholder View")
    }
}

struct DailyScheduleWidgetEntryView : View {
    var entry: EventProvider.Entry

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Text("Now: ")
                EventView(event: .constant(entry.currentEvent), current: true)
                    .cornerRadius(5.0)
            }
            HStack(alignment: .center) {
                Text("Next: ")
                EventView(event: .constant(entry.nextEvent), current: false)
                    .cornerRadius(5.0)
            }
        }
        .padding()
    }
}

@main
struct DailyScheduleWidget: Widget {
    private let kind: String = "io.austinbarrett.DailySchedule.widget"

    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: EventProvider(), placeholder: DailyScheduleWidgetEntryView(entry: EventEntry.placeholder)) { entry in
            DailyScheduleWidgetEntryView(entry: entry)
        }
        .configurationDisplayName("Now & Later")
        .description("Shows the current item in today's schedule and the next item.")
    }
}
