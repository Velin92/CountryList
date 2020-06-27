//
//  Country.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation

struct CountryModel {
    let name: String
    let capital: String
    let currency: CurrencyModel
    
    init?(from responseElement: CountriesListResponseElement) {
        guard let name = responseElement.name,
            let capital = responseElement.capital,
            let firstCurrency = responseElement.currencies?.first,
            let currencyModel = CurrencyModel(from: firstCurrency)else {
            return nil
        }
        self.name = name
        self.capital = capital
        self.currency = currencyModel
    }
}
