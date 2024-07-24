//
//  HomeView.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/7/3.
//

import SwiftUI

struct HomeView: View {
//    @Environment(ModelData.self) var modelData

    @State var tabIndex = 0

    @FetchRequest(entity: RoomA.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \RoomA.id, ascending: true)]) private var allRoomsA: FetchedResults<RoomA>

    var room: [RoomA] {
        allRoomsA.filter {
            rm in
            rm.id == String(tabIndex)
        }
    }

    @FetchRequest(entity: FacilityA.entity(), sortDescriptors: []) private var allFacilitiesA: FetchedResults<FacilityA>

    var facilitiesFilterd: [FacilityA] {
        allFacilitiesA.filter {
            f in
            f.room == room.first
        }
    }

    var body: some View {
        NavigationSplitView {
            VStack(alignment: .leading,
                   spacing: 10)
            {
                VStack {
                    CustomTopTabBar(tabIndex: $tabIndex, rooms: allRoomsA)
                        .padding(.leading)
                }

                VStack {
                    if tabIndex != 0 {
                        FacilityList(filteredFacilities: facilitiesFilterd)
                    } else {
                        FetcthedFacilityList(filteredFacilities: allFacilitiesA)
                    }
                }
            }
            .navigationTitle("Angie's Home")
            .navigationBarTitleDisplayMode(.inline)
        } detail: {
            Text("Select a Landmark")
        }
    }
}

struct CustomTopTabBar: View {
    @Binding var tabIndex: Int
    var rooms: FetchedResults<RoomA>
    
    var body: some View {
        HStack(spacing: 20) {
            TabBarButton(text: "ALL", isSelected: .constant(tabIndex == 0))
                .onTapGesture { onButtonTapped(index: 0) }

            ForEach(0 ..< rooms.count, id: \.self) { index in
                TabBarButton(text: rooms[index].name, isSelected: .constant(tabIndex == index + 1))
                    .onTapGesture { onButtonTapped(index: index + 1) }
            }
        }
    }

    private func onButtonTapped(index: Int) {
        withAnimation { tabIndex = index }
    }
}

struct TabBarButton: View {
    let text: String
    @Binding var isSelected: Bool
    var body: some View {
        Text(text)
            .fontWeight(isSelected ? .heavy : .regular)
            .font(.custom("Avenir", size: 16))
            .padding(.bottom, 10)
    }
}

//
// #Preview {
//    HomeView()
//        .environment(ModelData())
// }
