//
//  CountriesListInteractor.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation

protocol CountriesListInteractorProtocol: AnyObject {
    func loadAllCountries(completion: @escaping (Result<Void, Error>)->Void)
}

class CountriesListInteractor {
    
    let apiClient: CountriesListAPIClient
    
    init(apiClient: CountriesListAPIClient) {
        self.apiClient = apiClient
    }
    
}

extension CountriesListInteractor: CountriesListInteractorProtocol {
    func loadAllCountries(completion: @escaping (Result<Void, Error>) -> Void) {
        apiClient.getAllCountriesList { [weak self] result in
            switch result {
            case .success(let response):
                print(response)
                completion(.success(()))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
