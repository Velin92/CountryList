//
//  CountriesListPresenter.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation

protocol CountriesListPresenterProtocol: AnyObject {
    func loadAllCountries()
}

class CountriesListPresenter {
    
    typealias CountriesListView = CountriesListViewProtocol & LoaderDisplayer
    let interactor: CountriesListInteractorProtocol
    var viewState: CountriesListViewState = CountriesListViewState()
    weak var view: CountriesListView!
    
    
    init(interactor: CountriesListInteractorProtocol, view: CountriesListView) {
        self.interactor = interactor
        self.view = view
    }
    
    private func updateView() {
        view.viewState = viewState
    }
    
}

extension CountriesListPresenter: CountriesListPresenterProtocol {
    func loadAllCountries() {
        view.showLoader()
        interactor.loadAllCountries { [weak self] result in
            self?.view.hideLoader()
            switch result {
            case .success(let models):
                self?.viewState.countriesViewState = models.map(CountryCellViewState.init)
                self?.updateView()
            case .failure(let error):
                print(error)
                break
            }
        }
    }
}
