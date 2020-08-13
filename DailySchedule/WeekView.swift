//
//  WeekView.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/21/20.
//

import SwiftUI
import WidgetKit

// Note: This is not a real working week view, just a quick thing to see the whole week
struct WeekView: View {
    @EnvironmentObject var model: DayModel
    @Binding var week: [Day]
    @State var selected: Int = Day.currentWeekday
    @State var showSettings: Bool = false
    @AppStorage("dinnerTime", store: UserDefaults(suiteName: "group.io.austinbarrett.dailyschedule")) var dinnerTime: Double = 19.5
    
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
            .sheet(isPresented: $showSettings, content: {
                NavigationView {
                    Form {
                        Picker("Dinner Time", selection: $dinnerTime) {
                            Text("5:00 PM").tag(17.0)
                            Text("5:30 PM").tag(17.5)
                            Text("6:00 PM").tag(18.0)
                            Text("6:30 PM").tag(18.5)
                            Text("7:00 PM").tag(19.0)
                            Text("7:30 PM").tag(19.5)
                            Text("8:00 PM").tag(20.0)
                            Text("8:30 PM").tag(20.5)
                        }
                    }
                    .navigationTitle("Settings")
                    .navigationBarItems(trailing: Button("Done") {
                        model.setupEvents(dinnerTime: Float16(dinnerTime))
                        NotificationHandler.registerNotifications(for: model.days)
                        WidgetCenter.shared.reloadTimelines(ofKind: "io.austinbarrett.DailySchedule.widget")
                        showSettings = false
                    })
                }
            })
            .navigationTitle("My Schedule")
            .navigationBarItems(leading: Button(action: {
                showSettings = true
            }) {
                Image(systemName: "gear")
            }, trailing: Button(action: {
                NotificationHandler.registerNotifications(for: model.days)
            }) {
                ZStack {
                    Image(systemName: "bell.fill")
                        .font(.system(size: 14))
                    Image(systemName: "arrow.triangle.2.circlepath")
                        .font(.system(size: 24))
                }
                .foregroundColor(.primary)
            })
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(week: .constant([]))
    }
}
