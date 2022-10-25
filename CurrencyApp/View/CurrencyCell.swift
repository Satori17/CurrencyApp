//
//  CurrencyCell.swift
//  CurrencyApp
//
//  Created by Saba Khitaridze on 17.09.21.
//

import UIKit

class CurrencyCell: UITableViewCell {
    
    @IBOutlet weak var fakeView: UIView!
    @IBOutlet weak var currencyNameView: UIView!
    @IBOutlet weak var quantityLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var flagLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var exchangeLabel: UILabel!
    @IBOutlet weak var rateDifferenceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UIDesign()
    }
        
    private func UIDesign() {
        fakeView.layer.cornerRadius = 20
        fakeView.layer.borderWidth = 1
        fakeView.layer.borderColor = UIColor.gray.cgColor
    }
    
    private func customizeCurrencyName(indexPath: IndexPath, data: CurrencyModel) {
        nameLabel.text = indexPath.row == 0 ? "არაბეთის გს დირჰამი" : data.name
    }
    
    func configure(with data: CurrencyModel, indexPath: IndexPath) {
        currencyLabel.text = data.code
        quantityLabel.text = "\(data.quantity ?? 0)"
        exchangeLabel.text = data.rateFormatted
        if let difference = data.diff {
            rateDifferenceLabel.textColor = difference > 0 ? .red : .green
            let diffSign = difference > 0 ? "↑" : "↓"
            rateDifferenceLabel.text = diffSign + (data.diffFormated ?? "")
        }
        customizeCurrencyName(indexPath: indexPath, data: data)        
        flagLabel.text = data.flag
    }
}
