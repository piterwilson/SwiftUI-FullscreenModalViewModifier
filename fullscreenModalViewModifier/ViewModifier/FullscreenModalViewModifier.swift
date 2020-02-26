//
//  FullscreenModalViewModifier.swift
//  fullscreenModalViewModifier
//
//  Created by Juan Carlos Ospina Gonzalez on 25/02/2020.
//
import SwiftUI

extension View {
    func modal<T: View>(isPresented: Binding<Bool>, @ViewBuilder content: @escaping () -> T) -> some View {
        self.modifier(FullscreenModalPresentationModifier(content: content, isPresented: isPresented, transition: nil))
    }
    func modal<T: View>(isPresented: Binding<Bool>, transition: AnyTransition, @ViewBuilder content: @escaping () -> T) -> some View {
        self.modifier(FullscreenModalPresentationModifier(content: content, isPresented: isPresented, transition: transition))
    }
}

struct FullscreenModalPresentationModifier<Modal>: ViewModifier where Modal: View {
    var isPresented: Binding<Bool>
    var content: () -> Modal
    var transition: AnyTransition = .slideVertical
    public init(@ViewBuilder content: @escaping () -> Modal, isPresented: Binding<Bool>, transition: AnyTransition? = nil) {
        self.content = content
        self.isPresented = isPresented
        if let transition = transition {
            self.transition = transition
        }
    }
    func body(content: Content) -> some View {
        ZStack {
            if isPresented.wrappedValue {
                self.content()
                    .transition(transition)
            } else {
                content
            }
        }
    }
}
