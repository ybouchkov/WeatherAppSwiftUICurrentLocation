//
//  Extension.swift
//  WeatherAppSwiftUICurrentLocation
//
//  Created by Yani Buchkov on 5.01.22.
//

import Foundation
import SwiftUI

// Extension for rounded Double to 0 decimals
extension Double {
    func roundDoubleDegrees() -> String {
        return String.init(format: "%.0f°", self)
    }
    
    func roundDoubleMetersPerSecond() -> String {
        return String.init(format: "%.0f m/s", self)
    }
    
    func roundDoube() -> String {
        return String.init(format: "%.0f", self)
    }
}

// Extension for adding rounded corners to specific corners
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
