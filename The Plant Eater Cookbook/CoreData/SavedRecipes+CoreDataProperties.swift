//
//  SavedRecipes+CoreDataProperties.swift
//  
//
//  Created by James Hallemans on 2/10/18.
//
//

import Foundation
import CoreData


extension SavedRecipes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedRecipes> {
        return NSFetchRequest<SavedRecipes>(entityName: "SavedRecipes")
    }

    @NSManaged public var category: String?
    @NSManaged public var cookTime: NSDate?
    @NSManaged public var name: String?
    @NSManaged public var nbServe: Int16
    @NSManaged public var prepTime: NSDate?
    @NSManaged public var shortDescr: String?
    @NSManaged public var source: String?

}
