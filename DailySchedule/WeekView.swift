//
//  WeekView.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/21/20.
//

import SwiftUI

// Note: This is not a real working week view, just a quick thing to see the whole week
struct WeekView: View {
    @Binding var week: [Day]
    @State var selected: Int = Day.currentWeekday
    
    var body: some View {
        NavigationView {
            VStack {
                DayView(day: $week[selected])
                Spacer()
                Picker("Day of Week", selection: $selected) {
                    Text("Mon").tag(1)
                    Text("Tue").tag(2)
                    Text("Wed").tag(3)
                    Text("Thu").tag(4)
                    Text("Fri").tag(5)
                    Text("Sat").tag(6)
                    Text("Sun").tag(0)
                }
                .pickerStyle(SegmentedPickerStyle())
                .labelsHidden()
                .padding()
            }
            .navigationTitle("My Schedule")
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(week: .constant([]))
    }
}
