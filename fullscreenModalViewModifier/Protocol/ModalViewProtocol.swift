//
//  ModalView.swift
//  fullscreenModalViewModifier
//
//  Created by Juan Carlos Ospina Gonzalez on 26/02/2020.
//  Copyright © 2020 Juan Carlos Ospina Gonzalez. All rights reserved.
//

import SwiftUI

protocol ModalViewProtocol: View {
    var dismissAnimation: Animation { get set }
    var isPresented: Binding<Bool> { get }
    func dismiss()
}

extension ModalViewProtocol {
    func dismiss() {
        withAnimation(dismissAnimation) {
            self.isPresented.wrappedValue.toggle()
        }
    }
}
