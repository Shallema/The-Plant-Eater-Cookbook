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
    

    
    func search(withQuery query: String, completionHandler: @escaping ([EdamamRecipe]) -> Void) {
//        let params = ["app_id": "480e6bf7", "app_key": "58c6e7a6db9850b6210b1af9c77cbc79",
//                      "from": "0" , "to": "9", "health": "vegan", "q": query]
//
//        let searchURL2 = EdamamAPIController.baseURL.withQueries(params)!
//
        let strUrl = "https://api.edamam.com/search?app_id=480e6bf7&health=vegan&from=0&app_key=58c6e7a6db9850b6210b1af9c77cbc79&to=9&q=\(query.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!)"
        
        
        let searchURL = URL(string: strUrl)!

        URLSession.shared.dataTask(with: searchURL) { (data, response, error) in

            if let data = data {
           
                var searchValues: [EdamamRecipe] = []
                do {
                    let apiDescr = try JSONDecoder().decode(ApiDescr.self, from: data)
                    for hit in apiDescr.hits {
                        searchValues.append(hit.recipe)
                    }
                } catch {
                    print("Parsing Error: \(error)")
                }
                DispatchQueue.main.async {
                    completionHandler(searchValues)
                }
            }
            }.resume()
    }
}
