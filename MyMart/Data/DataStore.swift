//
//  DataStore.swift
//  MyMart
//
//  Created by Yoga Pratama on 22/11/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import Foundation
import UIKit

final class DataStore{
    static let sharedInstance = DataStore()
    fileprivate init(){}
    
    var filmlists : [FilmList] = []
    var images: [UIImage] = []
   
    
    func getFilm(completion: @escaping () -> Void){
        APIClient.getFilmListAPI{ (json) in
             print("getting data")
           
            let feed = json?["feed"] as? FilmListJSON
            if let results = feed?["results"] as? [FilmListJSON]{
                for dict in results{
                    let newFilmlist =  FilmList(dictionary: dict)
                    self.filmlists.append(newFilmlist)
                }
                completion()
            }
        }
    }
    
    
    
    func getFilmPoster(completion : @escaping () -> Void){
        getFilm {
            print("get poster ......")
            for film in self.filmlists{
                let url = URL(string: film.converImage)
                
                let data = try? Data(contentsOf: url!)
                if let imageData = data{
                     print("getting images...")
                     let image = UIImage(data: imageData)
                     self.images.append(image!)
                }
            }
            
            OperationQueue.main.addOperation {
                completion()
            }
        }
    }
}
