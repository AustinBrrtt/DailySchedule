//
//  EventView.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import SwiftUI

struct EventView: View {
    @Binding var event: Event
    var current: Bool
    
    var body: some View {
        HStack {
            LabelWorkaround(event.title, systemImage: event.icon)
            Spacer()
            Text(event.timeString)
        }
        .foregroundColor(current ? event.color.contrastingForeground : event.color)
        .padding(.horizontal)
        .padding(.vertical, 5)
        .background(current ? AnyView(event.color) : AnyView(EmptyView()))
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            EventView(event: .constant(Event(title: "Sleep", color: Color.blue, start: 0, icon: "moon.fill")), current: false)
            
            EventView(event: .constant(Event(title: "Sleep", color: Color.red, start: 9.75, icon: "moon.fill")), current: false)
            
            EventView(event: .constant(Event(title: "Sleep", color: Color.orange, start: 11.99, icon: "moon.fill")), current: false)
            
            EventView(event: .constant(Event(title: "Sleep", color: Color.yellow, start: 12, icon: "moon.fill")), current: true)
            
            EventView(event: .constant(Event(title: "Sleep", color: Color.green, start: 12.5, icon: "moon.fill")), current: false)
            
            EventView(event: .constant(Event(title: "Sleep", color: Color.pink, start: 13, icon: "moon.fill")), current: false)
            
            EventView(event: .constant(Event(title: "Sleep", color: Color.purple, start: 20.45, icon: "moon.fill")), current: false)
            EventView(event: .constant(Event(title: "Sleep", color: Color.secondary, start: 23.99, icon: "moon.fill")), current: false)
        }
    }
}
