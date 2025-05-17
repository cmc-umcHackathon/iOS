//
//  Extension+Color.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/17/25.
//

import Foundation
import SwiftUI

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)
    _ = scanner.scanString("#")
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)
    
    let r = Double((rgb >> 16) & 0xFF) / 255.0
    let g = Double((rgb >>  8) & 0xFF) / 255.0
    let b = Double((rgb >>  0) & 0xFF) / 255.0
    self.init(red: r, green: g, blue: b)
  }
}

extension Color {
    static let black000 = Color(hex: "191D1F")
    static let white000 = Color(hex: "ffffff")
    
    static let green100 = Color(hex: "72CD77")
    static let green200 = Color(hex: "44C14B")
    static let green300 = Color(hex: "EDFFF2")
    static let green400 = Color(hex: "CEFFD4")
    static let green500 = Color(hex: "5CDF64")
    
    static let gray100 = Color(hex: "F2F4F8")
    static let gray200 = Color(hex: "E7EBEF")
    static let gray300 = Color(hex: "DEE2E6")
    static let gray400 = Color(hex: "CCD2D8")
    static let gray500 = Color(hex: "B5BBC1")
    static let gray600 = Color(hex: "3B3D40")
    
    static let red100 = Color(hex: "FFD3D3")
    static let red200 = Color(hex: "F56868")
}
