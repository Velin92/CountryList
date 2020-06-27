//
//  Currency.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation

struct CurrencyModel {
    let currencyName: String
    let currencyId: String
    let currencySymbol: String
    
    init?(from currencyResponse: Currency) {
        guard let name = currencyResponse.name,
            let code = currencyResponse.code,
            let symbol = currencyResponse.symbol else {
                return nil
        }
        self.currencyName = name
        self.currencyId = code
        self.currencySymbol = symbol
    }
}
