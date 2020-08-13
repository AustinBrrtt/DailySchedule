//
//  DayView.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import SwiftUI

struct DayView: View {
    @EnvironmentObject var model: DayModel
    @Binding var day: Day
    @State var currentEvent: Event?
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(day.events.indices, id: \.self) { id in
                    EventView(event: $day.events[id], current: day.events[id] == currentEvent)
                }
            }
            .padding(.bottom)
            .onAppear {
                model.refresh {
                    currentEvent = day.currentEvent()
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
