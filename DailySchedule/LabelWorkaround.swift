//
//  LabelWorkaround.swift
//  DailySchedule
//
//  Created by Austin Barrett on 7/18/20.
//

import SwiftUI

struct LabelWorkaround: View {
    var title: String
    var image: String
    
    init(_ title: String, systemImage: String) {
        self.title = title
        image = systemImage
    }
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: image)
            }
            .frame(width: 30)
            Text(title)
        }
    }
}

struct LabelWorkaround_Previews: PreviewProvider {
    static var previews: some View {
        LabelWorkaround("Hi", systemImage: "iphone")
    }
}
