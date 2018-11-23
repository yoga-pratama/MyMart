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
    @IBOutlet var searchText : UITextField!
    let actvt = UIActivityIndicatorView(style: .gray)
    let store = DataStore.sharedInstance

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
        collectionViewLayout?.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
        collectionViewLayout?.invalidateLayout()
        
      //  searchText.leftView = UIImageView(image : UIImage.fontAwesomeIcon(name: .search, style: .solid, textColor: UIColor.black, size: CGSize(width: 20 , height: 20)))
        
        searchText.setLeftView(imageName: "view")
        
        view.addSubview(actvt)
        // Set up its size (the super view bounds usually)
        actvt.frame = view.bounds
        // Start the loading animation
        actvt.startAnimating()

        
        store.getFilmPoster {
            self.actvt.removeFromSuperview()
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
       cell.moviePoster.layer.cornerRadius = 10
       cell.moviePoster.clipsToBounds = true
        
        
        return cell
    }
    
    @IBAction func OnTouchText(_ sender: UITextField) {
        print("enter.....")
        performSegue(withIdentifier: "homesearchSegue", sender: self)
        
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

extension UITextField{
    
    func setLeftView(imageName: String){
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20 ))
        imageView.image = UIImage.fontAwesomeIcon(name: .search, style: .solid, textColor: UIColor.gray, size: CGSize(width: 20 , height: 20))
        self.leftView = imageView
        self.leftViewMode = .always
    }
    
}
