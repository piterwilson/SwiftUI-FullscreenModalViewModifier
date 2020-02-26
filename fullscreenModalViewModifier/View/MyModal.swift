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

struct MyModal: ModalViewProtocol {
    /// This binding should point to the parent `View` Binding that makes this modal appear
    var isPresented: Binding<Bool>
    /// Animation used on dismiss
    var dismissAnimation: Animation = .easeOut
    /// Simulates a class dependency
    private let sanityCheck = SanityCheck()
    
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
        MyModal(isPresented:  Binding<Bool>(
               get: { false },
               set: { print($0) }
           ))
    }
}
