//
//  BeerCollectionViewCell.swift
//  Beers
//
//  Created by Shwe Yi Tun on 11/17/18.
//  Copyright © 2018 Shwe Yi Tun. All rights reserved.
//

import UIKit

class BeerCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var beerImage: UIImageView!
    
    @IBOutlet weak var beerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
