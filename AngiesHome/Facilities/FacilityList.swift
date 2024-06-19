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
    
    var filteredFacilities: [Facility] {
        modelData.facilities.filter {
            fc in
            (!showOpenOnly ||  fc.status)
        }
    }

    
    var body: some View {
        NavigationSplitView {
            List {
                Toggle(isOn: $showOpenOnly) {
                    Text("Open only")
                }
                
                ForEach(filteredFacilities) {facility in
                    NavigationLink {
                        FacilityDetail(facility: facility)
                    } label: {
                        FacilityRow(facility: facility)
                        
                    }
                }
            }
            .navigationTitle("AngiesHome")
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
                    Text("Select a Landmark")
        }
    }
}

#Preview {
    FacilityList()
        .environment(ModelData())
}
