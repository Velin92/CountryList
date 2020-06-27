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
    
    @IBOutlet weak var searchTextField: UITextField!
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
        searchTextField.addTarget(self, action: #selector(searchTextDidChange(_:)), for: .editingChanged)
        presenter.loadAllCountries()
    }
    
    @objc func searchTextDidChange(_ sender: UITextField) {
        presenter.searchFilterDidChange(sender.text)
    }
}

extension CountriesListViewController: CountriesListViewProtocol {
    
}

