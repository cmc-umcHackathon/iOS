//
//  Extension+View.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/17/25.
//

import Foundation
import SwiftUI

extension View {
    func customeStroke(color: Color, width: CGFloat) -> some View {
        self.modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
}
