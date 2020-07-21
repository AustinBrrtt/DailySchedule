//
//  DailyScheduleApp.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import SwiftUI

@main
struct DailyScheduleApp: App {
    @StateObject var dayModel: DayModel = DayModel()
    
    var body: some Scene {
        WindowGroup {
            WeekView(week: $dayModel.days)
                .environmentObject(dayModel)
        }
    }
}
