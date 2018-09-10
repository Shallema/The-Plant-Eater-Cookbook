//
//  Recipes.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 10/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import Foundation
import UIKit

class Recipe {
    var name: String
    var category: Category
    var descr: String
    var mealPrep: String
    var image: UIImage
    
    init(name: String, category: Category, descr: String, mealPrep: String, image: UIImage) {
        self.name = name
        self.category = category
        self.descr = descr
        self.mealPrep = mealPrep
        self.image = image
    }
}
