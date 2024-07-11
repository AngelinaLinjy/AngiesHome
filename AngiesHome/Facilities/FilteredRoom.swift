//
//  FilteredRoom.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/7/1.
//

import SwiftUI


struct FilteredRoom: View {

    var filteredFacilitiesList: [FacilityA]
    
    var body: some View{
        ScrollView {
            LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                
                ForEach(filteredFacilitiesList) { facility in
                    NavigationLink(destination: FacilityDetail(facility: facility)) {
                        FacilityRow(facility: facility)
                    }
                }
                .padding(.horizontal)
            }
        }

    }
    
}

//
//#Preview {
//    let facilities = ModelData().facilities
//    return FilteredRoom(filteredFacilitiesList: facilities)
//        .environment(ModelData())
//}
