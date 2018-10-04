//
//  SavedRecipes+CoreDataProperties.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 04/10/2018.
//  Copyright © 2018 SandrineH. All rights reserved.
//
//

import Foundation
import CoreData


extension SavedRecipes {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<SavedRecipes> {
        return NSFetchRequest<SavedRecipes>(entityName: "SavedRecipes")
    }

    @NSManaged public var cookTime: Double
    @NSManaged public var name: String?
    @NSManaged public var nbServe: Int64
    @NSManaged public var prepTime: Double
    @NSManaged public var shortDescr: String?
    @NSManaged public var source: String?
    @NSManaged public var subcatId: Int64

}
