//
//  APIClient.swift
//  MyMart
//
//  Created by Yoga Pratama on 21/11/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import Foundation

typealias FilmListJSON = [String:Any]

struct APIClient {
    
    static func getFilmListAPI(completion : @escaping (FilmListJSON?) -> Void){
        let url = URL(string: "https://rss.itunes.apple.com/api/v1/id/movies/top-movies/all/25/explicit.json")
        
        let session = URLSession.shared
        
        guard let unwrappedURL = url else{ print("Error unwrapping URL"); return}
        
        let dataTask = session.dataTask(with: unwrappedURL){(data , response, error) in
            
            guard let unwrappedData = data else { print("Error unwrapping data"); return}
            
            do {
                let responseJSON = try JSONSerialization.jsonObject(with: unwrappedData, options: []) as? FilmListJSON
                
                
                completion(responseJSON)
            } catch {
                print("Could not get API data. \(error), \(error.localizedDescription)")
            }
            
           
        }
        dataTask.resume()
    }
    
}
