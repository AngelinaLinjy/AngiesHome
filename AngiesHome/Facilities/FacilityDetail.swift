//
//  FacilityDetail.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/13.
//

import SwiftUI

struct FacilityDetail: View {
    @Environment(ModelData.self) var modelData
    var facility: Facility
    
    var facilityIndex: Int {
           modelData.facilities.firstIndex(where: { $0.id == facility.id })!
       }
    
    var body: some View {
        @Bindable var modelData = modelData
        
        ScrollView {
                    Image("living-room")
                        .frame(height: 400)


            CircleImage(image: facility.image)
                        .offset(y: -130)
                        .padding(.bottom, -130)


                    VStack(alignment: .leading) {
                        HStack {
                           Text(facility.name)
                               .font(.title)
                           ToggleButton(isSet: $modelData.facilities[facilityIndex].status)
                               }
                
        


                        HStack {
                            Text(String(facility.status))
                            
                        }
                        .font(.subheadline)
                        .foregroundStyle(.secondary)

                        Divider()

                        Text(facility.description)
                            .font(.title2)
                    }
                    .padding()


                    Spacer()
                }
    }
}


#Preview {
    let facilities = ModelData().facilities
    return FacilityDetail(facility: facilities[0])
        .environment(ModelData())
}
