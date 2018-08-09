//
//  ViewController.swift
//  GETRequest
//
//  Created by Maze Geek on 8/8/18.
//  Copyright © 2018 Amit Biswas. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

   
    static let kBPI = "bpi"
    static let kUSD = "USD"
    static let kRATE = "rate_float"
    
    @IBOutlet weak var priceLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        priceLabel.text = "..."
        
        Alamofire.request("https://api.coindesk.com/v1/bpi/currentprice.json").responseJSON{ response in
            
        print(response)
            
            if let bitcoinJSON = response.result.value {
                
                let bitcoinObject: Dictionary = bitcoinJSON as! Dictionary<String, Any>
                
                let bpiObject: Dictionary = bitcoinObject[ViewController.kBPI] as! Dictionary<String, Any>
                
                let usdObject : Dictionary = bpiObject[ViewController.kUSD] as! Dictionary<String, Any>
                
                let rate: Float = Float(truncating: usdObject[ViewController.kRATE] as! NSNumber)
               
            
                
                self.priceLabel.text = "$\(rate)"
                
            }

        }
    print("Loading Web services")
    
    
    }

    
    

   
    
}



