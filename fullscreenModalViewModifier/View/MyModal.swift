//
//  ModalView.swift
//  fullscreenModalViewModifier
//
//  Created by Juan Carlos Ospina Gonzalez on 25/02/2020.
//

import SwiftUI

/// This is just a dummie class to confirm `ModalView` and its dependencies are deinited when the `.modal()` causes it to close
class SanityCheck {
    deinit {
        print("\(#file):\(#line) \(#function) Called.")
    }
}

protocol ModalView: View {
    var dismiss: (() -> Void) { get set }
}

struct MyModal: ModalView {
    /// Simulates a class dependency
    private let sanityCheck = SanityCheck()
    /// Action used to dismiss
    var dismiss: (() -> Void) = {}
    init() {}
    init(dismiss: @escaping (() -> Void)) {
        self.dismiss = dismiss
        print("\(#file):\(#line) \(#function) Called.")
    }
    var body: some View {
        ZStack {
            Color.blue
            VStack {
                Text("I am a modal.")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                Button(action: {
                    self.dismiss()
                }, label: {
                    Text("OK, BYE!")
                        .foregroundColor(.white)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.white, lineWidth: 1)
                    )
                })
            }
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        MyModal()
    }
}
