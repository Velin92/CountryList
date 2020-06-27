//
//  CountriesListTableViewManager.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation
import UIKit

class CountriesListTableViewManager: NSObject {
    var dataSource: [CountryCellViewState] = []
}

extension CountriesListTableViewManager: UITableViewDelegate {
    
}

extension CountriesListTableViewManager: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountriesTableViewCell" ) as? CountriesTableViewCell else {
            fatalError("Wrong identifier")
        }
        cell.countryCapitalLabel.text = dataSource[indexPath.row].capital
        cell.countryNameLabel.text = dataSource[indexPath.row].name
        cell.countryCurrencyName.text = dataSource[indexPath.row].currencyName
        cell.countryCurrencyIdentifier.text = dataSource[indexPath.row].currencyIdentifier
        return cell
    }
}
