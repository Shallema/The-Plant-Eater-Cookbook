//
//  FoodSubcategory+CoreDataProperties.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 04/10/2018.
//  Copyright © 2018 SandrineH. All rights reserved.
//
//

import Foundation
import CoreData


extension FoodSubcategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodSubcategory> {
        return NSFetchRequest<FoodSubcategory>(entityName: "FoodSubcategory")
    }

    @NSManaged public var junkfood: String?
    @NSManaged public var indian: String?
    @NSManaged public var lebanese: String?
    @NSManaged public var asian: String?
    @NSManaged public var burger: String?
    @NSManaged public var pasta: String?
    @NSManaged public var tofu: String?
    @NSManaged public var biscuit: String?
    @NSManaged public var pie: String?
    @NSManaged public var salty: String?
    @NSManaged public var vegan_cheese: String?
    @NSManaged public var juice: String?
    @NSManaged public var iced_tea: String?
    @NSManaged public var salad: String?
    @NSManaged public var foodCategory: FoodCategory?
    @NSManaged public var recipes: SavedRecipes?

}
