//
//  ViewController.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import UIKit

protocol CountriesListViewProtocol: UIViewController {
    
}

class CountriesListViewController: UIViewController, Storyboarded {
    
    static let storyboardName = "Main"
    static let storyboardId = "CountriesListViewController"
    
    @IBOutlet weak var countriesTableView: UITableView!
    
    var presenter: CountriesListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.loadAllCountries()
    }
}

extension CountriesListViewController: CountriesListViewProtocol {
    
}

