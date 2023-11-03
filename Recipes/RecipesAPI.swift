//
//  RecipesAPI.swift
//  Recipes
//
//  Created by samah khoja on 11/1/23.
//

import Foundation

struct RecipesAPI {
    let appId = "7272bd16"
    let appKey = "a79ec51dd7b8da119e24f75977bb4dde"

    
    static let shared = RecipesAPI()
    
    private let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func search(for searchString : String) async throws {
        var urlComponents = URLComponents()
        urlComponents.host = "api.edamam.com/api/recipes/v2"
        urlComponents.scheme = "https"
        
        let param1 = URLQueryItem(name: "app_id", value: appId)
        let param2 = URLQueryItem(name: "app_key", value: appKey)
        let param3 = URLQueryItem(name: "type", value: "public")
        let param4 = URLQueryItem(name: "q", value: searchString)
        
        urlComponents.queryItems = [param1, param2, param3, param4]
        
        let request = URLRequest(url: urlComponents.url!)
        urlSession.dataTask(with: request) { data, urlResponse, error in
            if let error = error {
                // handle error
            }
            else if let data = data, let response = urlResponse as? HTTPURLResponse {
                guard response.statusCode == 200 else {
                    // handle error response code
                    return
                }
                decode(data)
            }
        }
        
    }
    
    private func decode(_ data : Data) -> [Recipe] {
        guard let
    }
    
    
}

struct Recipe: Codable {
    let label : String
    let image : String
    let calories : Int
    let totalTime : Int
    let mealType : String
    let ingredients : [Ingredient]
}

struct Ingredient : Codable {
    let quantity : Int
    let measure : String
}


