//
//  CountriesListViewState.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation

struct CountryCellViewState {
    let name: String
    let capital: String
    let currencyName: String
    let currencyIdentifier: String
    
    init(from model: CountryModel) {
        self.name = model.name
        self.capital = model.capital
        self.currencyName = model.currency.currencyName
        self.currencyIdentifier = "\(model.currency.currencyId) \(model.currency.currencySymbol)"
    }
}

struct CountriesListViewState {
    var countriesViewState: [CountryCellViewState] = []
}
