//
//  FacilityList.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/13.
//

import SwiftUI

struct FacilityList: View {
    @Environment(ModelData.self) var modelData
    
    @State private var showOpenOnly = true
    
    var filteredFacilities: [Facility]
    
//    var filteredFacilities: [Facility] {
//        modelData.facilities.filter {
//            fc in
//            !showOpenOnly || fc.status
//        }
//    }
    
    var body: some View {
        NavigationSplitView {
            VStack(alignment: .leading,
                   spacing: 10)
            {
                VStack {
//                    Toggle(isOn: $showOpenOnly) {
//                                        Text("Open only")
//                                    }
//                                    .padding(.horizontal)
//                                    .padding(.top) // Add top padding to the Toggle
                    
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(filteredFacilities) { facility in
                                NavigationLink(destination: FacilityDetail(facility: facility)) {
                                    FacilityRow(facility: facility)
                                }
                            }
                            .padding(.horizontal)
                        }
                    }
                }
            }
//            .navigationTitle("Angie's Home")
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            Text("Select a Landmark")
        }
    }
}


#Preview {
    let facilities = ModelData().rooms.first?.facilities ?? []
    return FacilityList(filteredFacilities: facilities)
        .environment(ModelData())
}
