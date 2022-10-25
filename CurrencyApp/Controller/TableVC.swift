//
//  TableVC.swift
//  CurrencyApp
//
//  Created by Saba Khitaridze on 17.09.21.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let currency = currencyData?[0], let currencies = currency.currencies {
            return currencies.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell") as! CurrencyCell
        if let data = currencyData?[0] {
            if var currentData = data.currencies?[indexPath.row] {
                currentData.flag = flags[indexPath.row]
                cell.configure(with: currentData, indexPath: indexPath)
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
}
