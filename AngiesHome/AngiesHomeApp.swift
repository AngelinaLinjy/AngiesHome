//
//  AngiesHomeApp.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/12.
//

import SwiftUI

@main
struct AngiesHomeApp: App {
    
    @State private var modelData = ModelData()
    
    
    
    // Create an observable instance of the Core Data stack.
//    @StateObject private var coreDataStack = CoreDataStack.shared
    let persistentContainer = CoreDataManager.shared.persistenContainer
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(modelData)
            
            
            
            // Inject the persistent container's managed object context
                       // into the environment.
                           .environment(\.managedObjectContext,
                                         persistentContainer.viewContext)
        }
    }
}
