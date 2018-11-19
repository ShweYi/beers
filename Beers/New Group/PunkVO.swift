//
//  PunkVO.swift
//  NetworkingAssignment
//
//  Created by Shwe Yi Tun on 11/16/18.
//  Copyright © 2018 Shwe Yi Tun. All rights reserved.
//

import Foundation
import SwiftyJSON

class PunkVO {
    var name : String? = nil
    var tagline : String? = nil
    var first_brewed : String? = nil
    var description : String? = nil
    var image_url : String? = nil
    var ingredients = ingredient()
    
    var food_pairing : [String]? = nil
    var brewers_tips : String? = nil
    var contributed_by : String? = nil
    
    static func parseToPunkVO(_ data : JSON) -> PunkVO {
        
        let beer = PunkVO()
        beer.name = data["name"].string
        beer.tagline = data["tagline"].string
        beer.first_brewed = data["first_brewed"].string
        beer.description = data["description"].string
        beer.image_url = data["image_url"].string
        beer.brewers_tips = data["brewers_tips"].string
        beer.contributed_by = data["contributed_by"].string
        beer.ingredients.malt = data["ingredients"]["malt"].array
        beer.ingredients.hops = data["ingredients"]["hops"].array
        beer.food_pairing = data["food_pairing"].arrayValue.map{$0.stringValue}
        return beer
        
    }
    
}
