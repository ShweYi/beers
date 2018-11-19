//
//  hops.swift
//  NetworkingAssignment
//
//  Created by Shwe Yi Tun on 11/16/18.
//  Copyright © 2018 Shwe Yi Tun. All rights reserved.
//

import Foundation
import SwiftyJSON

class hops{
    var name:String? = nil
    var add:String? = nil
    var attribute:String? = nil
    var amount = Amount()
    
    static func parseToHopsVO(_ data : JSON) -> hops {
        
        let beerhops = hops()
        beerhops.name = data["name"].string
        beerhops.add = data["add"].string
        beerhops.amount = Amount.parseToAmountVO(JSON(data["amount"]))
        beerhops.attribute = data["attribute"].string
        
        return beerhops
        
    }
    
}
