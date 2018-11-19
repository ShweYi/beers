//
//  Amount.swift
//  Beers
//
//  Created by Shwe Yi Tun on 11/19/18.
//  Copyright © 2018 Shwe Yi Tun. All rights reserved.
//

import SwiftyJSON

class Amount {
    var value:Double? = 0.0
    var unit:String? = nil
    
    static func parseToAmountVO(_ data : JSON) -> Amount {
        
        let amount = Amount()
        amount.value = data["value"].double
        amount.unit = data["unit"].string
        return amount
        
    }
}

