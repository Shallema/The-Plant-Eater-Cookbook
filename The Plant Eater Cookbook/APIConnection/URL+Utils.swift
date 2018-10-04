//
//  URL+Utils.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 28/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import Foundation

extension URL {
    
    func withQueries(_ queries: [String: String]) -> URL? {
        
        var components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        components?.queryItems = queries.compactMap { URLQueryItem(name: $0.0, value: $0.1) }
        return components?.url
    }
}
