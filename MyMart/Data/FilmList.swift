//
//  FilmList.swift
//  MyMart
//
//  Created by Yoga Pratama on 21/11/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import Foundation


struct FilmList {
    let name : String
    let releaseDate : String
    let converImage : String
    
    init(dictionary : FilmListJSON) {
        self.name = dictionary["name"] as! String
        self.releaseDate = dictionary["releaseDate"] as! String
        self.converImage = dictionary["artworkUrl100"] as! String
    }
    
}
