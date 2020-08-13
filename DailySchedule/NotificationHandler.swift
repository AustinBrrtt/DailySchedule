//
//  NotificationHandler.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/19/20.
//

import Foundation
import UserNotifications

class NotificationHandler {
    static func registerNotifications(for days: [Day], completion: @escaping (Bool) -> Void = { _ in }) {
        let center = UNUserNotificationCenter.current()
        center.removeAllPendingNotificationRequests() // Must remove *all* because any items removed from the list must have their notifications removed too
        let options: UNAuthorizationOptions = [.alert, .sound];
        center.requestAuthorization(options: options) { (granted, error) in
            if (!granted || error != nil) {
                completion(false)
                return
            }
            
            for day in days {
                for event in day.events {
                    let content = UNMutableNotificationContent()
                    content.title = "Time's Up!"
                    content.body = "Time \(event.toFor == .to ? "to" : "for") \(event.title)"
                    content.sound = UNNotificationSound.default
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: day.dateComponents(for: event), repeats: true)
                    let identifier = "io.austinbarrett.DailySchedule.\(event.safeIdentifier)"
                    let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

                    center.add(request, withCompletionHandler: { (error) in
                        completion(error != nil)
                    })
                }
            }
        }
    }
}
