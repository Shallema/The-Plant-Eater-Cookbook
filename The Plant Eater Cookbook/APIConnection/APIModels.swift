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
    let count: Int
    let hits: [Recipes]
}

struct Recipes: Decodable {
    let label: String
    let image: String
    let source: String
    let url: String
    
    enum CodingKeys: String, CodingKey {
        case label = "label"
        case image = "image"
        case source = "source"
        case url = "url"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.label = try values.decode(String.self, forKey: CodingKeys.label)
        self.image = try values.decode(String.self, forKey: CodingKeys.image)
        self.source = try values.decode(String.self, forKey: CodingKeys.source)
        self.url = try values.decode(String.self, forKey: CodingKeys.url)
    }    
}
