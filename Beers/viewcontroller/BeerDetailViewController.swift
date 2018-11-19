//
//  BeerDetailViewController.swift
//  Beers
//
//  Created by Shwe Yi Tun on 11/17/18.
//  Copyright © 2018 Shwe Yi Tun. All rights reserved.
//

import UIKit
import CarbonKit

class BeerDetailViewController: UIViewController , CarbonTabSwipeNavigationDelegate {
    
    var beerdetail : PunkVO?=nil
    // Screen width.
    public var screenWidth: CGFloat {
        return UIScreen.main.bounds.width
    }
    @IBAction func backHome(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    func carbonTabSwipeNavigation(_ carbonTabSwipeNavigation: CarbonTabSwipeNavigation, viewControllerAt index: UInt) -> UIViewController {
        if index == 0 {
            let screen = self.storyboard?.instantiateViewController(withIdentifier: "DescriptionViewController") as! DescriptionViewController
            screen.beer = self.beerdetail
            return screen
        }else {
            let screen = self.storyboard?.instantiateViewController(withIdentifier: "IngredientsViewController") as! IngredientsViewController
            screen.beer = self.beerdetail
            return screen
        }
       
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let items = ["Contents","Ingredients"]
        let carbonTabSwipeNavigation = CarbonTabSwipeNavigation(items: items, delegate: self)
        
        carbonTabSwipeNavigation.setTabExtraWidth(screenWidth * 0.3)
        carbonTabSwipeNavigation.setTabBarHeight(50)
        carbonTabSwipeNavigation.setNormalColor(UIColor.gray)
        carbonTabSwipeNavigation.setIndicatorColor(UIColor.black)
        carbonTabSwipeNavigation.setSelectedColor(UIColor.blue)
        carbonTabSwipeNavigation.insert(intoRootViewController: self)
        // or carbonTabSwipeNavigation.insertIntoRootViewController(self, andTargetView: yourView)
    }
    
    
}


