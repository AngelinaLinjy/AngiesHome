//
//  ContentView.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/12.
//

import SwiftUI

struct ContentView: View {
//    var facilities: [Facility] = load("facilityData.json")

    
    var body: some View {
        FacilityList()
    }
   
}

#Preview {
    ContentView()
    .environment(ModelData())
}
