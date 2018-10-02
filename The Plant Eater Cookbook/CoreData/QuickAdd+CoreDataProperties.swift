//
//  QuickAdd+CoreDataProperties.swift
//  
//
//  Created by James Hallemans on 2/10/18.
//
//

import Foundation
import CoreData


extension QuickAdd {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<QuickAdd> {
        return NSFetchRequest<QuickAdd>(entityName: "QuickAdd")
    }

    @NSManaged public var name: String?
    @NSManaged public var briefDescr: String?
    @NSManaged public var category: String?

}
