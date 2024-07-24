//
//  CircleImage.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/12.
//

import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}
//
//#Preview {
//    CircleImage(image: Image("room"))
//}
