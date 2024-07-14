//
//  AddFacilityAndRoom.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/7/9.
//

import SwiftUI

struct EditFacilityRoomView
: View {

    @EnvironmentObject var manager: CoreDataStack
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(entity: RoomA.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \RoomA.id, ascending: true)]) private var allRoomsA: FetchedResults<RoomA>
    
    @State private var selectedOption = 0
    
    var roomNameList: [String] {
        allRoomsA.map{$0.name}
    }

    @State private var name: String = ""
    @State private var usage: String = ""
    @State private var location: String = ""
    @State private var imageName: String = ""
    @State private var status: Bool = false

    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Enter the facility name", text: $name)
                } header: {
                    Text("Name")
                }

                Section {
                    TextField("Enter the facility usage", text: $usage)
                } header: {
                    Text("Usgae")
                }

                Section {
                    TextField("Enter the facility location", text: $location)
                } header: {
                    Text("Location")
                }

                Section {
                    TextField("Enter the facility image name", text: $imageName)
                } header: {
                    Text("Image Name")
                }

                Section {
                    Picker("Select status", selection: $status) {
                        Text("False").tag(false)
                        Text("True").tag(true)
                    }
                    .pickerStyle(SegmentedPickerStyle())
                } header: {
                    Text("Status")
                }
                
                Section {
                    Picker("Select Rom", selection: $selectedOption) {
                        ForEach(0..<roomNameList.count, id: \.self) { index in
                                        Text(roomNameList[index]).tag(index)
                                    }
                    }

                } header: {
                    Text("Status")
                }
            }
            .navigationTitle("New Facility")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        self.saveFacility(name: name, usage: usage, location: location, imageName: imageName,  status: status)
                    }
                }
            }
        }
    }
    
    // MARK: Core Data Operations
    func saveFacility(name: String, usage: String, location: String, imageName: String,  status: Bool) {
        let facility = FacilityA(context: self.viewContext)

        facility.name = name
        facility.usage = usage
        facility.location = location
        facility.imageName = imageName
        facility.status = status
        
        do {
            try self.viewContext.save()
            print("Facility saved!")
        } catch {
            print("whoops \\(error.localizedDescription)")
        }
    }
    
    
    

}
