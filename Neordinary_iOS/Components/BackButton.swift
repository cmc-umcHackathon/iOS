//
//  BackButton.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/18/25.
//

import Foundation
import SwiftUI

struct BackButton : View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Image(.MyPage.backButton)
        }
    }
}
