//
//  LandmarkRow.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/12.
//

import SwiftUI

var facility: [Facility] = load("facilityData.json")

struct FacilityRow: View {
    @Environment(ModelData.self) var modelData

    @State private var status = true

    var facility: Facility
    
    var facilityIndex: Int {
           modelData.facilities.firstIndex(where: { $0.id == facility.id })!
       }

    var body: some View {
        @Bindable var modelData = modelData
        
        HStack {
            facility.image
                          .resizable()
                          .frame(width: 50, height: 50)
                      Text(facility.name)
                      Spacer()
            

            if facility.status {
                Text("on")}
            
      
        }
    }
}


#Preview {
    let facilities = ModelData().facilities
    return Group{
        FacilityRow(facility: facilities[1])
    FacilityRow(facility: facilities[0])
    FacilityRow(facility: facilities[1])
    }
}

