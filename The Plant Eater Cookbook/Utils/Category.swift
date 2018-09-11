//
//  Categories.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 10/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import Foundation

class Category: Equatable {
    
    static func ==(lhs: Category, rhs: Category) -> Bool {
        return lhs.id == rhs.id
    }
    
    var id: Int
    var name: String
    var image: String
    
    init(id: Int, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
    
    static func fetchAllCategories() -> [Category]{
        let starter = Category(id: 1, name: "Starter", image: "")
        let main = Category(id: 2, name: "Main", image: "")
        let sweet = Category(id: 3, name: "Sweet", image: "")
        let drink = Category(id: 4, name: "Drink", image: "")
        let snack = Category(id: 5, name: "Snack", image: "")
        let all = Category(id: 6, name: "All", image: "")
        
        return [starter, main, sweet, drink, snack, all]
    }

}

class SubCategory: Category {

    var category:  Category
    
    init(id: Int, name: String, image: String, category: Category) {
        self.category = category
        super.init(id: id, name: name, image: image)
    }
    
    private static var allSubcategories: [SubCategory]{
        
        let starter = Category(id: 1, name: "Starter", image: "")
        let main = Category(id: 2, name: "Main", image: "")
        let sweet = Category(id: 3, name: "Sweet", image: "")
        let drink = Category(id: 4, name: "Drink", image: "")
        let snack = Category(id: 5, name: "Snack", image: "")
        let all = Category(id: 6, name: "All", image: "")
        
        return [SubCategory(id: 1, name: "JunkFood", image: "", category: starter),
                SubCategory(id: 2, name: "Indian", image: "", category: starter),
                SubCategory(id: 3, name: "Lebanese", image: "", category: main),
                SubCategory(id: 4, name: "Asian", image: "", category: main),
                SubCategory(id: 5, name: "Burger", image: "", category: main),
                SubCategory(id: 6, name: "Pasta", image: "", category: sweet),
                SubCategory(id: 7, name: "Biscuits", image: "", category: sweet),
                SubCategory(id: 8, name: "Pies", image: "", category: drink),
                SubCategory(id: 9, name: "Salty", image: "", category: snack),
                SubCategory(id: 10, name: "Sweet", image: "", category: all),
                SubCategory(id: 11, name: "All", image: "", category: all)]
    }
    
    static func getSubcategories(for category: Category) -> [SubCategory]{
        var subcategories = [SubCategory]()
        for subcategory in SubCategory.allSubcategories{
            if subcategory.category == category {
                subcategories.append(subcategory)
            }
        }
        return subcategories
    }

}
