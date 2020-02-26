//
//  SlideVerticalTransition.swift
//  fullscreenModalViewModifier
//
//  Created by Juan Carlos Ospina Gonzalez on 25/02/2020.
//

import SwiftUI

struct SlideVerticalModifier: ViewModifier {
    let offset: CGFloat
    func body(content: Content) -> some View {
        content.offset(CGSize(width: 0.0, height: offset))
    }
}

extension AnyTransition {
    static var slideVertical: AnyTransition {
        .modifier(
            active: SlideVerticalModifier(offset: UIScreen.main.bounds.height),
            identity: SlideVerticalModifier(offset: 00.0)
        )
    }
}
