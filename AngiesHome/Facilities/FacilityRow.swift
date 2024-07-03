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

        HStack (alignment: .top) {
            VStack (alignment: .leading, spacing: 5) {
                facility.image
                    .resizable()
                    .frame(width: 30, height: 30)
                Text(facility.name)
                    .foregroundStyle(.black)
                Text(facility.location)
                    .foregroundStyle(.gray)
            }
            
            Spacer()

            if facility.status {
                Image(systemName: "rays")
                    .foregroundColor(.green)
               
            } else {
                Image(systemName: "rays")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .overlay(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(.gray, lineWidth: 1)
            )
    }
}

#Preview {
    let facilities = ModelData().facilities
    return Group {
        FacilityRow(facility: facilities[1])
        FacilityRow(facility: facilities[0])
        FacilityRow(facility: facilities[1])
    }
}
