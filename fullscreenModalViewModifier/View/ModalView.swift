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

struct ModalView: View {
    /// Simulates a class dependency
    private let sanityCheck = SanityCheck()
    var closeAction: (() -> Void) = {}
    init() {}
    init(closeAction: @escaping (() -> Void)) {
        self.closeAction = closeAction
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
                    self.closeAction()
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
        ModalView()
    }
}