//
//  AngiesHomeApp.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/12.
//

import SwiftUI

@main
struct AngiesHomeApp: App {
    
    let persistentContainer = CoreDataManager.shared.persistenContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
               .environment(\.managedObjectContext,
                     persistentContainer.viewContext)
        }
    }
}
