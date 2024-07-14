//
//  FacilityList.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/7/14.
//

import SwiftUI

struct FacilityList: View {
    @Environment(ModelData.self) var modelData
    
    @State private var showOpenOnly = true
    
    var filteredFacilities: [FacilityA]
    
    var body: some View {
        NavigationSplitView {
            VStack(alignment: .leading,
                   spacing: 10)
            {
                VStack {
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
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            Text("Select a Landmark")
        }
    }
}

//
//
// #Preview {
//    let facilities = ModelData().rooms.first?.facilities ?? []
//    return FacilityList(filteredFacilities: facilities)
//        .environment(ModelData())
// }
