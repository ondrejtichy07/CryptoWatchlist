//
//  Cryptocurrency.swift
//  Crypto
//
//  Created by Ondřej on 07/06/2018.
//  Copyright © 2018 Ondřej Tichý. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON

class Crypto {
    var image : UIImage
    var name : String
    var shortcut : String
    var url : String
    var price : String
    
    
    init(image: UIImage, name: String, shortcut: String, url: String) {
        self.price = ""
        self.image = image
        self.shortcut = shortcut
        self.url = url
        self.name = name
        getData(url: self.url)
    }
    
    
    func getData(url: String) {
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess! Got the \(self.shortcut) data")
                    let actualJSON : JSON = JSON(response.result.value!)
                    self.updateData(json: actualJSON)
                    
                } else {
                    print("Error: \(String(describing: response.result.error))")
                }
        }
        
    }
    
    func updateData(json : JSON) {
        if let result = json["ask"].double {
            price = String(result)
        }
        else
        {
            print("Unavailable")
        }
    }
}
