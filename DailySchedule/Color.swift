//
//  Color.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import SwiftUI

extension Color {
    var contrastingForeground: Color {
        switch(self) {
        case .black:
            return .white
        case .blue:
            return .white
        case .gray:
            return .black
        case .green:
            return .black
        case .orange:
            return .black
        case .pink:
            return .black
        case .purple:
            return .white
        case .red:
            return .black
        case .yellow:
            return .black
        case .white:
            return .black
        case .primary:
            return Color(red: 0.5, green: 0.5, blue: 0.5)
        case .secondary:
            return .red
        case .cyan:
            return .black
        case .lightGrey:
            return .black
        case .betterBlue:
            return .white
        case .limeGreen:
            return .black
        case .betterPink:
            return .black
        case .betterOrange:
            return .black
        default:
            return .primary
        }
    }
    
    static var cyan = Color(red: 0, green: 0.847, blue: 0.902)
    static var lightGrey = primary.opacity(0.9)
    static var betterBlue = Color(red: 0.3, green: 0.7, blue: 0.9)
    static var limeGreen = Color(red: 0.75, green: 0.95, blue: 0.37)
    static var betterPink = Color(red: 1.0, green: 0.4, blue: 0.7)
    static var betterOrange = Color(red: 1.0, green: 0.4, blue: 0)
}
