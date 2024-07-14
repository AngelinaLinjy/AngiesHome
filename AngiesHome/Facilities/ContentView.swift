//
//  ContentView.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/12.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
                HomeView()
                   .tabItem {
                       Text("Home")
                       Image(systemName: "house.fill")
                     }
                   .badge("1")
            
            EditFacilityRoomView()
                   .tabItem {
                       Text("Add New Facility")
                       Image(systemName: "figure.walk")
                   }
            AddRoomView()
                   .tabItem {
                       Text("Add New Room")
                       Image(systemName: "house.fill")
                   }

        
            
        }

    }
   
}

#Preview {
    ContentView()
    .environment(ModelData())
}
