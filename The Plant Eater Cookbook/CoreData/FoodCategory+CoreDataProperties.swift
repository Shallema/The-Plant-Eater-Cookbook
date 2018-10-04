//
//  FoodCategory+CoreDataProperties.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 04/10/2018.
//  Copyright © 2018 SandrineH. All rights reserved.
//
//

import Foundation
import CoreData


extension FoodCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FoodCategory> {
        return NSFetchRequest<FoodCategory>(entityName: "FoodCategory")
    }

    @NSManaged public var breakfast: String?
    @NSManaged public var main: String?
    @NSManaged public var side: String?
    @NSManaged public var starter: String?
    @NSManaged public var snack: String?
    @NSManaged public var sweet: String?
    @NSManaged public var beverage: String?
    @NSManaged public var foodSubcategory: NSOrderedSet?

}

// MARK: Generated accessors for foodSubcategory
extension FoodCategory {

    @objc(insertObject:inFoodSubcategoryAtIndex:)
    @NSManaged public func insertIntoFoodSubcategory(_ value: FoodSubcategory, at idx: Int)

    @objc(removeObjectFromFoodSubcategoryAtIndex:)
    @NSManaged public func removeFromFoodSubcategory(at idx: Int)

    @objc(insertFoodSubcategory:atIndexes:)
    @NSManaged public func insertIntoFoodSubcategory(_ values: [FoodSubcategory], at indexes: NSIndexSet)

    @objc(removeFoodSubcategoryAtIndexes:)
    @NSManaged public func removeFromFoodSubcategory(at indexes: NSIndexSet)

    @objc(replaceObjectInFoodSubcategoryAtIndex:withObject:)
    @NSManaged public func replaceFoodSubcategory(at idx: Int, with value: FoodSubcategory)

    @objc(replaceFoodSubcategoryAtIndexes:withFoodSubcategory:)
    @NSManaged public func replaceFoodSubcategory(at indexes: NSIndexSet, with values: [FoodSubcategory])

    @objc(addFoodSubcategoryObject:)
    @NSManaged public func addToFoodSubcategory(_ value: FoodSubcategory)

    @objc(removeFoodSubcategoryObject:)
    @NSManaged public func removeFromFoodSubcategory(_ value: FoodSubcategory)

    @objc(addFoodSubcategory:)
    @NSManaged public func addToFoodSubcategory(_ values: NSOrderedSet)

    @objc(removeFoodSubcategory:)
    @NSManaged public func removeFromFoodSubcategory(_ values: NSOrderedSet)

}
