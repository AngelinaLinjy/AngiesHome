//
//  OpenButton.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/17.
//

import SwiftUI

struct ToggleButton: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var isToggleOn: Bool

    var facility: FacilityA

    init(isToggleOn: Bool, facility: FacilityA) {
        self.isToggleOn = facility.status
        self.facility = facility
    }

    var body: some View {
        Toggle(self.isToggleOn ? "Turn Off" : "Turn On", isOn: self.$isToggleOn)
            .onChange(of: self.isToggleOn) {
                self.saveStatusChange(facility: self.facility)
            }
    }

    func saveStatusChange(facility: FacilityA) {

//        facility.name = facility.name
//        facility.usage = facility.usage
//        facility.imageName = facility.imageName
        facility.status = !facility.status

        do {
            try self.viewContext.save()
            print("Status Change saved!")
        } catch {
            print("whoops \\(error.localizedDescription)")
        }
    }
}

// #Preview {
//    ToggleButton(isToggleOn: true, facility: )
// }
