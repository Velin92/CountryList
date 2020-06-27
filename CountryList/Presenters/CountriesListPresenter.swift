//
//  CountriesListPresenter.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation

protocol CountriesListPresenterProtocol: AnyObject {
    
}

class CountriesListPresenter {
    
    typealias CountriesListView = CountriesListViewProtocol
    let interactor: CountriesListInteractorProtocol
    weak var view: CountriesListView!
    
    init(interactor: CountriesListInteractorProtocol, view: CountriesListView) {
        self.interactor = interactor
        self.view = view
    }
    
}

extension CountriesListPresenter: CountriesListPresenterProtocol {
    
}
