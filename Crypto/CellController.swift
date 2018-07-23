//
//  CellController.swift
//  Crypto
//
//  Created by Ondřej on 07/06/2018.
//  Copyright © 2018 Ondřej Tichý. All rights reserved.
//

import UIKit

class CellController: UITableViewCell {
    
    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    @IBOutlet weak var currencyLabelCell: UILabel!
    
    func setCrypto(crypto: Crypto) {
        imageCell.image = crypto.image
        currencyLabelCell.text = crypto.name
        labelCell.text = crypto.price + (" $")
    }
    
}
