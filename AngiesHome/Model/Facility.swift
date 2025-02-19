//
//  Facility.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/13.
////

import Foundation
import SwiftUI

struct Facility: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var status: Bool
    var description: String
//    var location: String
    
    var imageName: String
//    var image: Image {
//        Image(imageName)
//    }

}


struct Room: Hashable, Codable, Identifiable  {
    var id: Int
    var name: String
    var facilities: [Facility] = []
}
