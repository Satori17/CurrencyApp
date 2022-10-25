//
//  CurrencyModel.swift
//  CurrencyApp
//
//  Created by Saba Khitaridze on 18.09.21.
//

import UIKit

struct CurrencyData: Codable {
    var currencies: [CurrencyModel]?
}

struct CurrencyModel: Codable {
    var code: String?
    var quantity: Int?
    var rateFormatted: String?
    var diff: Double?
    var diffFormated: String?
    var name: String?
    var validFromDate: String?
    var flag: String?
}
