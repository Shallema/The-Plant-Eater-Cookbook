//
//  Categories.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 10/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import Foundation

class Category {
    var id: Int = 0
    var name: String = ""
    var image: String = ""
    var subcategories: [SubCategory] = []
    
    init(){
        
    }
}


class SubCategory {
    var id: Int = 0
    var name: String = ""
    var image: String = ""
    
    init(){
        
    }
}
