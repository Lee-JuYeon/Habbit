//
//  TopRoundedRectangle.swift
//  iOS_Habbit
//
//  Created by C.A.V.S.S on 6/3/24.
//

import SwiftUI

struct TopRoundedRectangle: Shape {
    var radius: CGFloat = .infinity
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
