//
//  malt.swift
//  NetworkingAssignment
//
//  Created by Shwe Yi Tun on 11/16/18.
//  Copyright © 2018 Shwe Yi Tun. All rights reserved.
//

import Foundation
import SwiftyJSON

class malt{
    var name : String? = nil
    var amount = Amount()
    
    static func parseToMaltVO(_ data : JSON) -> malt {
        
        let beermalt = malt()
        beermalt.name = data["name"].string
        beermalt.amount = Amount.parseToAmountVO(JSON(data["amount"]))
        return beermalt
        
    }
}

