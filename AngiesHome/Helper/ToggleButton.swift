//
//  OpenButton.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/17.
//

import SwiftUI


struct ToggleButton: View {
    @Binding var isSet: Bool
    
    var body: some View {
        Button {
                   isSet.toggle()
               } label: {
                   Label("Turn On", systemImage: isSet ? "checkmark.square" : "square")
                       .labelStyle(.iconOnly)
                       .foregroundStyle(isSet ? .green : .gray)
               }
    }
}


#Preview {
    ToggleButton(isSet: .constant(true))
}

