//
//  DescriptionViewController.swift
//  Beers
//
//  Created by Shwe Yi Tun on 11/17/18.
//  Copyright © 2018 Shwe Yi Tun. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var tagline: UILabel!
    
    @IBOutlet weak var first_brewed: UILabel!
    
    @IBOutlet weak var brewer_tips: UILabel!
    
    @IBOutlet weak var contributed_by: UILabel!
    
    @IBOutlet weak var beerDescription: UILabel!
    
    var beer : PunkVO? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let beer = beer {
            beerImage.sd_setImage(with: URL(string: beer.image_url ?? "https://images.punkapi.com/v2/192.png" ), placeholderImage: UIImage(named: "beer"))
            name.text = beer.name ?? "Network Error"
            tagline.text = beer.tagline ?? "Network Error"
            first_brewed.text = beer.first_brewed ?? "Network Error"
            contributed_by.text = beer.contributed_by ?? "Network Error"
            beerDescription.text = beer.description ?? "Network Error"
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onClickImage))
        tap.numberOfTapsRequired = 1
        beerImage.isUserInteractionEnabled = true
        beerImage.addGestureRecognizer(tap)
        
    }

    @objc func onClickImage(sender:UIImage){
        
        let screen = self.storyboard?.instantiateViewController(withIdentifier: "ZoomViewController") as! ZoomViewController
        screen.beer = self.beer
        self.present(screen, animated: true, completion: nil)
        
    }
}
