//
//  RoundedCorners.swift
//  PlayAway
//
//  Created by kamila on 26/11/25.
//

import SwiftUI

struct RoundedCorners: Shape {
    var radius: CGFloat = 25
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

