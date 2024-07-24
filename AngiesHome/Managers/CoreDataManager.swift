//
//  CoreDataManager.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/7/11.
//

import Foundation
import CoreData

class CoreDataManager: ObservableObject {
    
    let persistenContainer: NSPersistentContainer
    static let shared: CoreDataManager = CoreDataManager()
    
    private init() {
        
        persistenContainer = NSPersistentContainer(name: "FacilityModel")
        persistenContainer.loadPersistentStores {
            description, error in
            if let error = error {
                fatalError("Unable to initialize Core Data \(error)")
            }
        }
    }
}
