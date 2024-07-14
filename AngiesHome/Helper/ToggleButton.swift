//
//  OpenButton.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/6/17.
//

import SwiftUI


struct ToggleButton: View {
    @Environment(\.managedObjectContext) private var viewContext

    @State private var isToggleOn = false
    
   var facility: FacilityA
    
    var body: some View {
        Toggle(isToggleOn ? "Turn Off" : "Turn On", isOn: $isToggleOn)
               .onChange(of: isToggleOn) {
                   self.saveStatusChange(facility: facility)
               }
    }
    
    
    func saveStatusChange(facility: FacilityA){
        let fetchedFacility = FacilityA(context: self.viewContext)
        
        fetchedFacility.name = facility.name
        fetchedFacility.usage =  facility.usage
        fetchedFacility.location =  facility.location
        fetchedFacility.imageName =  facility.imageName
        fetchedFacility.status =  !facility.status
        
        do {
            try self.viewContext.save()
            print("Status Change saved!")
        } catch {
            print("whoops \\(error.localizedDescription)")
        }
    }
}




//#Preview {
//    ToggleButton(isSet: .constant(true))
//}
//
