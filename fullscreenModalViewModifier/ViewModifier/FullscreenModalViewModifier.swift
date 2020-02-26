//
//  FullscreenModalViewModifier.swift
//  fullscreenModalViewModifier
//
//  Created by Juan Carlos Ospina Gonzalez on 25/02/2020.
//
import SwiftUI

extension View {
    func modal<T: View>(isPresented: Binding<Bool>, @ViewBuilder modalView: @escaping () -> T) -> some View {
        self.modifier(FullscreenModalPresentationModifier(modalView: modalView, showModal: isPresented, transition: nil))
    }
    func modal<T: View>(isPresented: Binding<Bool>, transition: AnyTransition, @ViewBuilder modalView: @escaping () -> T) -> some View {
        self.modifier(FullscreenModalPresentationModifier(modalView: modalView, showModal: isPresented, transition: transition))
    }
}

struct FullscreenModalPresentationModifier<Modal>: ViewModifier where Modal: View {
    var showModal: Binding<Bool>
    var modalContent: () -> Modal
    var transition: AnyTransition = .slideVertical
    public init(@ViewBuilder modalView: @escaping () -> Modal, showModal: Binding<Bool>, transition: AnyTransition? = nil) {
        self.modalContent = modalView
        self.showModal = showModal
        if let transition = transition {
            self.transition = transition
        }
    }
    func body(content: Content) -> some View {
        ZStack {
            if showModal.wrappedValue {
                self.modalContent()
                    .transition(transition)
            } else {
                content
            }
        }
    }
}
