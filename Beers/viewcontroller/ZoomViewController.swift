//
//  ZoomViewController.swift
//  Beers
//
//  Created by Shwe Yi Tun on 11/17/18.
//  Copyright © 2018 Shwe Yi Tun. All rights reserved.
//

import UIKit

class ZoomViewController: UIViewController,UIScrollViewDelegate{

    @IBOutlet weak var scrollview: UIScrollView!
    
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var image: UIImageView!
    
    
    var beer : PunkVO? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.scrollview.minimumZoomScale = 1.0
        self.scrollview.maximumZoomScale = 6.0
        if let beer = beer {
            beerImage.sd_setImage(with: URL(string: beer.image_url ?? "https://images.punkapi.com/v2/192.png" ), placeholderImage: UIImage(named: "beer"))
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.closeImage))
        tap.numberOfTapsRequired = 1
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(tap)
    }
    
    @objc func closeImage(sender:UIImage){
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.beerImage
    }

}
