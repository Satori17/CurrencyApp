//
//  TableVC.swift
//  CurrencyApp
//
//  Created by Saba Khitaridze on 17.09.21.
//

import UIKit

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let currency = currencyData?[0] {
            if let currencies = currency.currencies {
                return currencies.count
            }
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyCell") as! CurrencyCell
        if let data = currencyData?[0] {
            if let current = data.currencies?[indexPath.row] {
                cell.currencyLabel.text = current.code
                cell.quantityLabel.text = "\(current.quantity!)"
                cell.exchangeLabel.text = current.rateFormated
                if let difference = current.diff {
                    if difference > 0 {
                        cell.rateDifferenceLabel.textColor = .red
                        cell.rateDifferenceLabel.text = "↑\(current.diffFormated!)"
                    } else {
                        cell.rateDifferenceLabel.textColor = .green
                        cell.rateDifferenceLabel.text = "↓\(current.diffFormated!)"
                    }
                }
                if indexPath.row == 0 {
                    cell.nameLabel.text = "არაბეთის გს დირჰამი"
                } else {
                    cell.nameLabel.text = current.name
                }
            }
        }
        
        let flags = flags[indexPath.row]
        cell.flagLabel.text = flags
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        120
    }
    
}
