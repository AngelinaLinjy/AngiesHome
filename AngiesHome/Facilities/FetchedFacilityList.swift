//
//  FacilityList.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/13.
//

import SwiftUI

struct FetcthedFacilityList: View {
//    @Environment(ModelData.self) var modelData
    
    @State private var showOpenOnly = true
    
    var filteredFacilities: FetchedResults<FacilityA>
    
    var body: some View {
        NavigationSplitView {
            VStack(alignment: .leading,
                   spacing: 10)
            {
                VStack {
                    ScrollView {
                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                            ForEach(filteredFacilities, id: \.self) { facility in
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
