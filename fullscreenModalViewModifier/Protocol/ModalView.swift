//
//  ModalView.swift
//  fullscreenModalViewModifier
//
//  Created by Juan Carlos Ospina Gonzalez on 26/02/2020.
//  Copyright © 2020 Juan Carlos Ospina Gonzalez. All rights reserved.
//

import SwiftUI

protocol ModalView: View {
    var dismiss: (() -> Void) { get set }
}
