//
//  IngredientsViewController.swift
//  Beers
//
//  Created by Shwe Yi Tun on 11/17/18.
//  Copyright © 2018 Shwe Yi Tun. All rights reserved.
//

import UIKit

class IngredientsViewController: UIViewController {
    
    var beer : PunkVO? = nil
    var maltList : [malt] = []
    var hopsList : [hops] = []
    var foodpairinglist : [String] = []
    
    @IBOutlet weak var ingredientTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let beer = beer {
            
            if let maltvalue = beer.ingredients.malt {
                
                var maltList : [malt] = []
                
                maltvalue.forEach({ (m) in
                    maltList.append(malt.parseToMaltVO(m))
                })
                
                self.maltList = maltList
                self.ingredientTableView.reloadData()
                
            }
            
            if let hopsvalue = beer.ingredients.hops {
                
                var hopsList : [hops] = []
                
                hopsvalue.forEach({ (h) in
                    hopsList.append(hops.parseToHopsVO(h))
                })
                
                self.hopsList = hopsList
                self.ingredientTableView.reloadData()
                
            }
            
            if let foodvalue = beer.food_pairing {
                
                var foodlist : [String] = []
                
                foodvalue.forEach({ (f) in
                    foodlist.append(f)
                })
                
                self.foodpairinglist = foodlist
                self.ingredientTableView.reloadData()
            }
            
        }
        
        cellRegister()
    }
    
    func cellRegister(){
        let nib = UINib(nibName: "IngredientTableViewCell", bundle: nil)
        self.ingredientTableView.register(nib, forCellReuseIdentifier: "IngredientTableViewCell")
    }
    
}


extension IngredientsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return self.maltList.count
        } else if (section == 1) {
            return self.hopsList.count
        } else {
            return self.foodpairinglist.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientTableViewCell", for: indexPath) as! IngredientTableViewCell
        if indexPath.section == 0 {
            let amount = String (self.maltList[indexPath.row].amount.value ?? 0.0)
            let unit = self.maltList[indexPath.row].amount.unit ?? "Network Error"
            cell.name.textColor = UIColor.darkGray
            cell.name.text = self.maltList[indexPath.row].name
            cell.amount.text = amount + " " + unit
        } else if indexPath.section == 1 {
            let amount = String (self.hopsList[indexPath.row].amount.value ?? 0.0)
            let attribute = self.hopsList[indexPath.row].attribute ?? "Network Error"
            let add = self.hopsList[indexPath.row].add ?? "Network Error"
            let unit = self.hopsList[indexPath.row].amount.unit ?? "Network Error"
            cell.name.textColor = UIColor.brown
            cell.name.text = self.hopsList[indexPath.row].name
            cell.amount.text = amount + " " + unit + " " + attribute + " " + add
        } else {
            cell.name.textColor = UIColor.black
            cell.name.text = "Food Pairings"
            cell.amount.text =  self.foodpairinglist[indexPath.row]
        }
        
        
        return cell
        
    }
    
    
}

extension ViewController : UITableViewDelegate {
    
}
