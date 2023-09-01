//
//  Entity3+CoreDataProperties.swift
//  WithoutStoryboard
//
//  Created by Nata Kuznetsova on 27.08.2023.
//
//

import Foundation
import CoreData


extension Entity3 {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Entity3> {
        return NSFetchRequest<Entity3>(entityName: "Entity3")
    }


}

extension Entity3 : Identifiable {

}
