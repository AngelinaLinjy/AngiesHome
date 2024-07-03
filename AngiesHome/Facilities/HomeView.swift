//
//  HomeView.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/7/3.
//

import SwiftUI

struct HomeView: View {
    @Environment(ModelData.self) var modelData
    
    @State var tabIndex = 0
    
//    @State private var showOpenOnly = true
    
    var rooms: [Room]? {
        modelData.rooms.filter {
            rm in
            rm.id == tabIndex + 1
        }
    }

    var body: some View {
        NavigationSplitView {
            VStack(alignment: .leading,
                   spacing: 10)
            {
                VStack {
                    CustomTopTabBar(tabIndex: $tabIndex, rooms: modelData.rooms)
                        .padding(.leading)
                }
                
                VStack {
//                    Toggle(isOn: $showOpenOnly) {
//                                        Text("Open only")
//                                    }
//                                    .padding(.horizontal)
//                                    .padding(.top) // Add top padding to the Toggle
                    
//                    ScrollView {
//                        LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
//                            ForEach(filteredFacilities) { facility in
//                                NavigationLink(destination: FacilityDetail(facility: facility)) {
//                                    FacilityRow(facility: facility)
//                                }
//                            }
//                            .padding(.horizontal)
//                        }
//                    }
                    
                    FacilityList(filteredFacilities: rooms?.first?.facilities ?? [])
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
    var rooms: [Room]
    var body: some View {
        HStack(spacing: 20) {
//            TabBarButton(text: "FirstView", isSelected: .constant(tabIndex == 0))
//                .onTapGesture { onButtonTapped(index: 0) }
//            TabBarButton(text: "SecondView", isSelected: .constant(tabIndex == 1))
//                .onTapGesture { onButtonTapped(index: 1) }
//            Spacer()
            
            ForEach(0 ..< rooms.count) { index in
                TabBarButton(text: rooms[index].name, isSelected: .constant(tabIndex == index))
                    .onTapGesture { onButtonTapped(index: index) }
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
//            .border(ShapeStyle, width: isSelected ? 2 : 1, edges: [.bottom], color: .black)
//            .border(width: isSelected ? 2 : 1, edges: [.bottom], color: .black)
    }
}

#Preview {
    HomeView()
        .environment(ModelData())
}
