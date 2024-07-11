//
//  RoomA+CoreDataProperties.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/7/11.
//
//

import Foundation
import CoreData


extension RoomA {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<RoomA> {
        return NSFetchRequest<RoomA>(entityName: "RoomA")
    }

    @NSManaged public var id: String
    @NSManaged public var name: String
    @NSManaged public var facilities: [FacilityA]

}

// MARK: Generated accessors for facilities
extension RoomA {

    @objc(addFacilitiesObject:)
    @NSManaged public func addToFacilities(_ value: FacilityA)

    @objc(removeFacilitiesObject:)
    @NSManaged public func removeFromFacilities(_ value: FacilityA)

    @objc(addFacilities:)
    @NSManaged public func addToFacilities(_ values: NSSet)

    @objc(removeFacilities:)
    @NSManaged public func removeFromFacilities(_ values: NSSet)

}

extension RoomA : Identifiable {

}
