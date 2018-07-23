//
//  ListControllerViewController.swift
//  Crypto
//
//  Created by Ondřej on 07/06/2018.
//  Copyright © 2018 Ondřej Tichý. All rights reserved.
//

import UIKit


class ListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var currencies: [Crypto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencies = createArray()
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.addSubview(self.refreshControl)
    }

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:
            #selector(ListController.handleRefresh(_:)),
                                 for: UIControlEvents.valueChanged)
        refreshControl.tintColor = UIColor.white
        
        return refreshControl
    }()
    
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
        self.tableView.reloadData()
        refreshControl.endRefreshing()
        print("Good!")
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    func createArray() -> [Crypto] {
        var tempCryptos: [Crypto] = []
        
        let crypto1 = Crypto(image: #imageLiteral(resourceName: "Bitcoin"), name: "Bitcoin", shortcut: "BTC", url: "https://apiv2.bitcoinaverage.com/indices/global/ticker/BTCUSD")
        let crypto2 = Crypto(image: #imageLiteral(resourceName: "Ethereum"), name: "Ethereum", shortcut: "ETH", url: "https://apiv2.bitcoinaverage.com/indices/global/ticker/ETHUSD")
        let crypto3 = Crypto(image: #imageLiteral(resourceName: "Litecoin"), name: "Litecoin", shortcut: "LTC", url: "https://apiv2.bitcoinaverage.com/indices/global/ticker/LTCUSD")
        let crypto4 = Crypto(image: #imageLiteral(resourceName: "Monero"), name: "Monero", shortcut: "XMR", url: "https://apiv2.bitcoinaverage.com/indices/global/ticker/XMRUSD")
        let crypto5 = Crypto(image: #imageLiteral(resourceName: "Ripple"), name: "Ripple", shortcut: "XRP", url: "https://apiv2.bitcoinaverage.com/indices/global/ticker/XRPUSD")
        let crypto6 = Crypto(image: #imageLiteral(resourceName: "Ethereum Classic"), name: "Ethereum Classic", shortcut: "ETC", url: "https://apiv2.bitcoinaverage.com/indices/local/ticker/ETCUSD")
        let crypto7 = Crypto(image: #imageLiteral(resourceName: "Dash"), name: "Dash", shortcut: "DASH", url: "https://apiv2.bitcoinaverage.com/indices/local/ticker/DASHUSD")
        let crypto8 = Crypto(image: #imageLiteral(resourceName: "Bitcoin Gold"), name: "Bitcoin Gold", shortcut: "BTG", url: "https://apiv2.bitcoinaverage.com/indices/local/ticker/BTGUSD")
        let crypto9 = Crypto(image: #imageLiteral(resourceName: "Eos"), name: "Eos", shortcut: "EOS", url: "https://apiv2.bitcoinaverage.com/indices/tokens/ticker/EOSUSD")
        let crypto10 = Crypto(image: #imageLiteral(resourceName: "Neo"), name: "Neo", shortcut: "NEO", url: "https://apiv2.bitcoinaverage.com/indices/local/ticker/NEOUSD")
        let crypto11 = Crypto(image: #imageLiteral(resourceName: "Tether"), name: "Tether", shortcut: "USDT", url: "https://apiv2.bitcoinaverage.com/indices/local/ticker/USDTUSD")
        
    
        
        
        tempCryptos.append(crypto1)
        tempCryptos.append(crypto2)
        tempCryptos.append(crypto3)
        tempCryptos.append(crypto4)
        tempCryptos.append(crypto5)
        tempCryptos.append(crypto6)
        tempCryptos.append(crypto7)
        tempCryptos.append(crypto8)
        tempCryptos.append(crypto9)
        tempCryptos.append(crypto10)
        tempCryptos.append(crypto11)
        
        return tempCryptos
    }

}

extension ListController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let crpt = currencies[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell") as! CellController
        
        cell.setCrypto(crypto: crpt)
        
        return cell
    }
}

