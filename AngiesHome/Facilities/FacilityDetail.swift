//
//  FacilityDetail.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/13.
//

import SwiftUI

struct FacilityDetail: View {
    var facility: FacilityA

    @FetchRequest(entity: FacilityA.entity(), sortDescriptors: []) private var facilities: FetchedResults<FacilityA>

    var facilityIndex: Int {
        facilities.firstIndex(where: { $0.id == facility.id })!
    }

    var body: some View {

        ScrollView {
            Image("Living-Room")
                .frame(height: 400)

            CircleImage(image: Image(facility.imageName ?? ""))
                .offset(y: -130)
                .padding(.bottom, -130)

            VStack(alignment: .leading) {
                HStack {
                    Text(facility.name)
                        .font(.title)
                    ToggleButton( isToggleOn: facility.status, facility: facility)
                }

                HStack {
                    Text(String(facility.status))
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()

                Text(facility.usage)
                    .font(.title2)
            }
            .padding()

            Spacer()
        }
    }
}

// #Preview {
//    FacilityList()
//        .environment(ModelData())
// }
