//
//  ViewController.swift
//  Beers
//
//  Created by Shwe Yi Tun on 11/17/18.
//  Copyright © 2018 Shwe Yi Tun. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SDWebImage

class ViewController: UIViewController {

    @IBOutlet weak var beerCollectionView: UICollectionView!
    var beerList : [PunkVO] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        beerCollectionView.dataSource = self
        beerCollectionView.delegate = self
        CellRegisterUtil.cellRegister(nibName: "BeerCollectionViewCell", collectionView: beerCollectionView)
        loadBeers(success: {(beerList) in
            self.beerList = beerList
            self.beerCollectionView.reloadData()
        }, failure: {error in
            print(error)
        })
    }


}

func loadBeers(success: @escaping ([PunkVO]) -> Void,
               failure: @escaping (String) -> Void){
    Alamofire.request("https://api.punkapi.com/v2/beers", method: .get).responseJSON { (response) in
        
        switch response.result {
            
        case .success:
            
             let data = response.result.value as? [[String: Any]]
             
                if let result = data {
                var beerList : [PunkVO] = []
                result.forEach({ (beer) in
                    print(JSON(beer)["name"].string ?? "Hello")
                    beerList.append(PunkVO.parseToPunkVO(JSON(beer)))
                })
                
                success(beerList)
            }
            
            break
            
        case .failure:
            print("fail call")
            failure("Fail")
            break
            
        }
        
    }
}

extension ViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return beerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BeerCollectionViewCell", for: indexPath) as! BeerCollectionViewCell
        let beer = self.beerList[indexPath.row]
        
        cell.beerName.text = beer.name ?? "Network Error"
        
        cell.beerImage.sd_setImage(with: URL(string: beer.image_url ?? "https://images.punkapi.com/v2/192.png" ), placeholderImage: UIImage(named: "beer"))
        
        return cell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}

extension ViewController : UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let navigationController = self.storyboard?.instantiateViewController(withIdentifier: "BeerDetailViewController") as! UINavigationController
        let vc = navigationController.viewControllers[0] as! BeerDetailViewController
        vc.beerdetail = beerList[indexPath.row]
    
        self.present(navigationController, animated: true, completion: nil)
        
        print(indexPath.row)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (self.view.frame.width/2 - 15)
        return CGSize(width: width, height: width * 2.0)
    }
}

