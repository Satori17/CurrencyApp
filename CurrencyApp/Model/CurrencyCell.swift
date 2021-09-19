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
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func UIDesign() {
        fakeView.layer.cornerRadius = 20
        fakeView.layer.borderWidth = 1
        fakeView.layer.borderColor = UIColor.gray.cgColor
    }
}
