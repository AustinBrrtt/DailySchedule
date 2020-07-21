//
//  DayView.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var model: DayModel
    @AppStorage("hasRegisteredNotifications") var hasRegisteredNotifications: Bool = false
    @Binding var day: Day
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(day.events.indices, id: \.self) { id in
                    EventView(event: $day.events[id], current: day.events[id] == day.currentEvent(Date()))
                }
            }
            .padding(.bottom)
            .onAppear {
                model.refresh()
                if (!hasRegisteredNotifications) {
                    NotificationHandler.registerNotifications(for: day) { successful in
                        hasRegisteredNotifications = successful
                    }
                }
            }
            .onTapGesture {
                // If a version of this app gets shipped, don't do this. This is so I can manually reregister notifications after making a change.
                NotificationHandler.registerNotifications(for: day) { successful in
                    hasRegisteredNotifications = successful
                }
            }
        }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DayView(day: .constant(DayModel().day))
            DayView(day: .constant(DayModel().day))
                .preferredColorScheme(.dark)
        }
    }
}
