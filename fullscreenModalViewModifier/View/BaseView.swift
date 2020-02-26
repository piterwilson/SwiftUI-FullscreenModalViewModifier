//
//  BaseView.swift
//  fullscreenModalViewModifier
//
//  Created by Juan Carlos Ospina Gonzalez on 25/02/2020.
//

import SwiftUI

struct BaseView: View {
    @State private var showModal1 = false
    @State private var showModal2 = false
    var body: some View {
        ZStack {
            Color.white
            VStack(spacing: 10.0) {
                Button(action: {
                    withAnimation(.easeOut(duration: 0.25)) {
                        self.showModal1 = true
                    }
                }, label: {
                    Text("Open Modal (Default)")
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    ).frame(width: 280.0)
                })
                Button(action: {
                    withAnimation(.easeOut(duration: 0.25)) {
                        self.showModal2 = true
                    }
                }, label: {
                    Text("Open Modal (Opacity)")
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.blue, lineWidth: 1)
                    ).frame(width: 280.0)
                })
            }
        }
        .modal(isPresented: $showModal1) {
            MyModal(isPresented: self.$showModal1)
        }
        .modal(isPresented: $showModal2, transition: .opacity) {
            MyModal(isPresented: self.$showModal2, animation: .easeOut)
        }
    }
}
