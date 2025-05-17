//
//  Extension+View.swift
//  Neordinary_iOS
//
//  Created by 남경민 on 5/17/25.
//

import Foundation
import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
    func customeStroke(color: Color, width: CGFloat) -> some View {
        self.modifier(StrokeModifier(strokeSize: width, strokeColor: color))
    }
    
    func customNavigationBar<L>(
        leftView: @escaping (()-> L)
    ) -> some View where L : View {
        modifier(
            CustomNavigationBarModifier(
                centerView: { EmptyView() },
                leftView: leftView,
                rightView: { EmptyView() }
            )
        )
    }
    func customNavigationBar<R>(
        rightView: @escaping (()-> R)
    ) -> some View where R : View {
        modifier(
            CustomNavigationBarModifier(
                centerView: { EmptyView() },
                leftView: { EmptyView()} ,
                rightView: rightView
            )
        )
    }
    
    func customNavigationBar<L,R>(
        leftView: @escaping (()-> L),
        rightView: @escaping (()-> R)
    ) -> some View where L : View, R: View {
        modifier(
            CustomNavigationBarModifier(
                centerView: { EmptyView() },
                leftView: leftView,
                rightView: rightView
            )
        )
    }
    func customNavigationBar<C,R>(
        centerView: @escaping (()-> C),
        rightView: @escaping (()-> R)
    ) -> some View where C : View, R: View {
        modifier(
            CustomNavigationBarModifier(
                centerView: centerView,
                leftView: { EmptyView() },
                rightView: rightView
            )
        )
    }
    func customNavigationBar<C,L>(
        leftView: @escaping (()-> L),
        centerView: @escaping (()-> C)
    ) -> some View where C : View, L: View {
        modifier(
            CustomNavigationBarModifier(
                centerView: centerView,
                leftView: leftView,
                rightView: { EmptyView() }
            )
        )
    }
    
    func customNavigationBar<C,L,R>(
        centerView: @escaping (()-> C),
        leftView: @escaping (()-> L),
        rightView: @escaping (()-> R)
    ) -> some View where C : View, L: View, R: View {
        modifier(
            CustomNavigationBarModifier(
                centerView: centerView,
                leftView: leftView,
                rightView: rightView
            )
        )
    }

}
