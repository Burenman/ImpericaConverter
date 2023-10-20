//
//  ColorSet .swift
//  Imperica
//
//  Created by Viktor on 2023-10-19.
//

import Foundation
import SwiftUI

extension Color {
    static let colorSet = Color("backgroundColor")
}

extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xFF) / 255.0,
            green: Double((hex >> 8) & 0xFF) / 255.0,
            blue: Double(hex & 0xFF) / 255.0,
            opacity: alpha
        )
    }
}
