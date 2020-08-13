//
//  DailyScheduleApp.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import SwiftUI

@main
struct DailyScheduleApp: App {
    @AppStorage("dinnerTime", store: UserDefaults(suiteName: "group.io.austinbarrett.dailyschedule")) var dinnerTime: Double = 19.5
    @AppStorage("hasRegisteredNotifications") var hasRegisteredNotifications: Bool = false
    @StateObject var dayModel: DayModel = DayModel()
    
    var body: some Scene {
        WindowGroup {
            WeekView(week: $dayModel.days)
                .environmentObject(dayModel)
                .onAppear {
                    dayModel.setupEvents(dinnerTime: Float16(dinnerTime))
                    if (!hasRegisteredNotifications) {
                        NotificationHandler.registerNotifications(for: dayModel.days) { successful in
                            hasRegisteredNotifications = successful
                        }
                    }
                }
        }
    }
}
