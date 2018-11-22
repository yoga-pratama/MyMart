//
//  HomeViewController.swift
//  MyMart
//
//  Created by Yoga Pratama on 21/11/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
   
    
    
    @IBOutlet var collectionView: UICollectionView!
    let store = DataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        store.getFilmPoster {
            self.collectionView.reloadSections(IndexSet(integer: 0))
        }
        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return store.filmlists.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewCell", for: indexPath) as! ListFilmCollectionViewCell
        let film = store.filmlists[indexPath.row]
        
        print(store.images[indexPath.row])
        cell.displayContent(image : store.images[indexPath.row] , title : film.name)
    
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
