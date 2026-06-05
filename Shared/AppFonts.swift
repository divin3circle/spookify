//
//  AppFonts.swift
//  Spookify
//
//  Created by Sylus Abel on 25/05/2026.
//

import Foundation
import SwiftUI

enum AppFonts {
    private static let regular = "Rubik-Regular"
    private static let medium = "Rubik-Medium"
    private static let semibold = "Rubik-SemiBold"
    
    static func body(_ size: CGFloat = 16) -> Font {
        return Font.custom(regular, size: size)
    }
    
    static func title(_ size: CGFloat = 24) -> Font {
        return Font.custom(semibold, size: size)
    }
    
    static func headline(_ size: CGFloat = 20) -> Font {
        return Font.custom(medium, size: size)
    }
    
    static func caption(_ size: CGFloat = 12) -> Font {
        return Font.custom(regular, size: size)
    }
}
