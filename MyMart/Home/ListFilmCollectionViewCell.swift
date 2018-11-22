//
//  ListFilmCollectionViewCell.swift
//  MyMart
//
//  Created by Yoga Pratama on 22/11/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import UIKit

class ListFilmCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var moviePoster : UIImageView!
    @IBOutlet var movieLabel : UILabel!
    
    func displayContent(image : UIImage , title : String){
        moviePoster.image = image
        movieLabel.text = title
    }
    
}
