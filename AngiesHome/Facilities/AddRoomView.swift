//
//  AddRoomView.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/7/14.
//


import SwiftUI

struct AddRoomView
: View {

    @EnvironmentObject var manager: CoreDataStack
    @Environment(\.managedObjectContext) private var viewContext


    @State private var name: String = ""
//    @State private var id: String = ""
//    @State private var facilities: [FacilityA]

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the facility name", text: $name)
                } header: {
                    Text("Name")
                }

            }
            .navigationTitle("New Room")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // Save the data and dismiss the sheet
                        self.saveRoom(name: name)
                        // Call a function to handle saving or further processing of the newTodo
                        // For example, you can pass it to a delegate or callback.
//                        isPresented = false
                    }
                }
            }
        }
    }
    
    // MARK: Core Data Operations
    func saveRoom(name: String) {
        let room = RoomA(context: self.viewContext)

        room.name = name

        
        do {
            try self.viewContext.save()
            print("Room saved!")
        } catch {
            print("whoops \\(error.localizedDescription)")
        }
    }
    
    
    

}
