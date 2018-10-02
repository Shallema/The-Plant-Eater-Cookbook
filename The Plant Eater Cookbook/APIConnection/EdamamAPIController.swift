//
//  EdamamAPIController.swift
//  The Plant Eater Cookbook
//
//  Created by James Hallemans on 28/09/18.
//  Copyright © 2018 SandrineH. All rights reserved.
//

import Foundation

class EdamamAPIController {
    
    static let shared = EdamamAPIController()
    
    static let baseURL = URL(string: "https://api.edamam.com/search?")!
    
    func search(withQuery query: [String: String], completionHandler: @escaping ([Recipes]) -> Void) {
        let searchURL = EdamamAPIController.baseURL.withQueries(query)!
        URLSession.shared.dataTask(with: searchURL) { (data, response, error) in
            
            if let data = data {
                let searchValues: [Recipes]
                do {
                    let apiDescr = try JSONDecoder().decode(ApiDescr.self, from: data)
                    searchValues = apiDescr.hits
                } catch {
                    print("Parsing Error: \(error)")
                    searchValues = []
                }
                DispatchQueue.main.async {
                    completionHandler(searchValues)
                }
            }
            }.resume()
    }
}
