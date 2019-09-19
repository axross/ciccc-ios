//
//  StoreItemController.swift
//  iTunesSearch
//
//  Created by Kohei Asai on 9/19/19.
//  Copyright © 2019 Caleb Hicks. All rights reserved.
//

import Foundation

class StoreItemController {
    func searchItems(matchWith queryParameters: [String: String], completion: @escaping ([StoreItem]?) -> Void) {
        let baseURL = URL(string: "https://itunes.apple.com/search?")!
        
        guard let searchURL = baseURL.withQueries(queryParameters) else {
            return completion(nil)
        }
        
        URLSession.shared.dataTask(with: searchURL) { (data, response, error) in
            guard (response as! HTTPURLResponse).statusCode == 200 else {
                return completion(nil)
            }
            
            guard let data = data else {
                return completion(nil)
            }
            
            guard let result = try? JSONDecoder().decode(SearchAPIResult.self, from: data) else {
                return completion(nil)
            }
            
            completion(result.results)
        }.resume()
    }
}

struct SearchAPIResult: Codable {
    var results: [StoreItem]
}
