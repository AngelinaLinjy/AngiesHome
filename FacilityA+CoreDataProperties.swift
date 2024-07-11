//
//  FacilityA+CoreDataProperties.swift
//  AngiesHome
//
//  Created by Angelina Lin on 2024/7/11.
//
//

import Foundation
import CoreData


extension FacilityA {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FacilityA> {
        return NSFetchRequest<FacilityA>(entityName: "FacilityA")
    }

    @NSManaged public var name: String
    @NSManaged public var status: Bool
    @NSManaged public var usage: String
    @NSManaged public var location: String
    @NSManaged public var imageName: String?
    @NSManaged public var id: String
    @NSManaged public var room: RoomA?

}

extension FacilityA : Identifiable {

}
