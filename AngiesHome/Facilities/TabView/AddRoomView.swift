//
//  AddRoomView.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/7/14.
//

import SwiftUI

struct AddRoomView:
    View
{
    @EnvironmentObject var manager: CoreDataManager
    @Environment(\.managedObjectContext) private var viewContext

    @State private var name: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the facility name", text: self.$name)
                } header: {
                    Text("Name")
                }
            }
            .navigationTitle("New Room")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        self.saveRoom(name: self.name)
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
