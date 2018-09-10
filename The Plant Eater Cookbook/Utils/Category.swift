//
//  Categories.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 10/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import Foundation

class Category {
    var id: Int
    var name: String
    var image: String
    var subcategories: [SubCategory]
    
    init(id: Int, name: String, image: String, subcategories: [SubCategory]) {
        self.id = id
        self.name = name
        self.image = image
        self.subcategories = subcategories
    }
}


class SubCategory {
    var id: Int
    var name: String
    var image: String
    
    init(id: Int, name: String, image: String) {
        self.id = id
        self.name = name
        self.image = image
    }
}
