//
//  Entity1+CoreDataProperties.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 27.08.2023.
//
//

import Foundation
import CoreData


extension Entity1 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity1> {
        return NSFetchRequest<Entity1>(entityName: "Entity1")
    }


}

extension Entity1 : Identifiable {

}
