//
//  APIModels.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 28/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import Foundation
import UIKit

struct ApiDescr: Decodable {
    let hits: [Hit]
    
    enum CodingKeys: String, CodingKey {
        case hits = "hits"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.hits = try values.decode([Hit].self, forKey: CodingKeys.hits)
    }
}

struct Hit: Decodable {
    let recipe : EdamamRecipe
    
    enum CodingKeys: String, CodingKey {
        case recipe = "recipe"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.recipe = try values.decode(EdamamRecipe.self, forKey: CodingKeys.recipe)
    }
}

struct EdamamRecipe: Decodable {
    let label: String
    let image: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case image = "image"
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try values.decode(String.self, forKey: CodingKeys.label)
        self.image = try values.decode(String.self, forKey: CodingKeys.image)
        self.url = try values.decode(String.self, forKey: CodingKeys.url)
    }    
}
