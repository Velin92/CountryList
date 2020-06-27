//
//  CountriesListInteractor.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation

enum CountriesListError: Error {
    case apiError(Error)
    case emptyList
}

protocol CountriesListInteractorProtocol: AnyObject {
    func loadAllCountries(completion: @escaping (Result<[CountryModel],  CountriesListError>)->Void)
}

class CountriesListInteractor {
    
    let apiClient: CountriesListAPIClient
    var countries: [CountryModel] = []
    
    init(apiClient: CountriesListAPIClient) {
        self.apiClient = apiClient
    }
    
}

extension CountriesListInteractor: CountriesListInteractorProtocol {
    func loadAllCountries(completion: @escaping (Result<[CountryModel], CountriesListError>) -> Void) {
        apiClient.getAllCountriesList { result in
            switch result {
            case .success(let response):
                let countries = response.compactMap(CountryModel.init)
                guard countries.count > 0 else {
                    completion(.failure(.emptyList))
                    return
                }
                self.countries = countries
                completion(.success(self.countries))
            case .failure(let error):
                completion(.failure(.apiError(error)))
            }
        }
    }
}
