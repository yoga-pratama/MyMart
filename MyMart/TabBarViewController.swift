//
//  TabBarViewController.swift
//  MyMart
//
//  Created by Yoga Pratama on 21/11/18.
//  Copyright © 2018 YPA. All rights reserved.
//

import UIKit



class TabBarViewController: UITabBarController {
    
    @IBOutlet var tabbar: UITabBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabbar.barTintColor = UIColor.white
        tabbar.tintColor = UIColor.orange
      //  tabbar.tintColor = UIColor(red: 229, green: 80, blue: 57, alpha: 1.0)
       setBarItem()
       
        // Do any additional setup after loading the view.
    }
    
    
    func setBarItem(){
        let home = (self.tabbar.items?[0])! as UITabBarItem
        
      //  home.image = UIImage.fontAwesomeIcon(name: .home, style: .solid, textColor: UIColor.black, size: CGSize(width: 40, height: 40)).withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
      //  home.selectedImage = UIImage.fontAwesomeIcon(name: .home, style: .solid, textColor: UIColor.black, size: CGSize(width: 40, height: 40)).withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
       // home.imageInsets = UIEdgeInsets(top: 6, left: 0, bottom: -6, right: 0)
        home.image = UIImage.fontAwesomeIcon(name: .home, style: .solid, textColor: UIColor.black, size: CGSize(width: 50 , height: 50))
        
        home.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        home.titlePositionAdjustment = UIOffset(horizontal: 0.0,vertical: 5.0)
       
        
        
        let cart = (self.tabbar.items?[1])! as UITabBarItem
        
        cart.image = UIImage.fontAwesomeIcon(name: .shoppingCart, style: .solid, textColor: UIColor.black, size: CGSize(width: 50, height: 50))
        
        cart.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
         cart.titlePositionAdjustment = UIOffset(horizontal: 0.0,vertical: 5.0)
        
        
        let profile = (self.tabbar.items?[2])! as UITabBarItem
        
        profile.image = UIImage.fontAwesomeIcon(name: .user, style: .solid, textColor: UIColor.black, size: CGSize(width: 50, height: 50))
        
        profile.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
        profile.titlePositionAdjustment = UIOffset(horizontal: 0.0,vertical: 5.0)
        
        
        
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
