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
                       Text("Scenarios")
                       Image(systemName: "figure.walk")
                   }
               Text("This is config page")
                   .tabItem {
                       Text("Config")
                       Image(systemName: "gear")
                   }

        
        
        }

    }
   
}

#Preview {
    ContentView()
    .environment(ModelData())
}
