//
//  ViewController.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import UIKit

protocol CountriesListViewProtocol: UIViewController {
    var viewState: CountriesListViewState {get set}
}

class CountriesListViewController: UIViewController, Storyboarded, LoaderDisplayer {
    
    static let storyboardName = "Main"
    static let storyboardId = "CountriesListViewController"
    
    var viewState = CountriesListViewState() {
        didSet {
            updateView()
        }
    }
    
    @IBOutlet weak var countriesTableView: UITableView!
    
    var presenter: CountriesListPresenterProtocol!
    let tableViewManager = CountriesListTableViewManager()
    
    private func updateView() {
        tableViewManager.dataSource = viewState.countriesViewState
        countriesTableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        countriesTableView.delegate = tableViewManager
        countriesTableView.dataSource = tableViewManager
        presenter.loadAllCountries()
    }
}

extension CountriesListViewController: CountriesListViewProtocol {
    
}

