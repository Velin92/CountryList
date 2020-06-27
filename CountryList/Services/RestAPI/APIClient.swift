//
//  APIService.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation
import Alamofire

protocol CountriesListAPIClient {
    func getAllCountriesList(completion: @escaping (AFResult<CountriesListResponse>) -> Void)
}

class APIClient {
    
    private func request<T: Codable> (_ urlConvertible: URLRequestConvertible, completion: @escaping (AFResult<T>) -> Void) {
        AF.request(urlConvertible).responseData(completionHandler:{ [weak self] (dataResponse: AFDataResponse<Data>) in
            self?.printResponse(response: dataResponse)
            let decoder = JSONDecoder()
            let response: AFResult<T> = decoder.decodeResponse(from: dataResponse)
            completion(response)
        })
    }
    
    private func printResponse(response: AFDataResponse<Data>) {
        guard let value = response.value,
            let string = NSString(data: value, encoding: String.Encoding.utf8.rawValue)
            else { return }
        
        print("response is:\n \(string)")
    }
}

extension APIClient: CountriesListAPIClient {
    
    func getAllCountriesList(completion: @escaping (AFResult<CountriesListResponse>) -> Void) {
        request(APIRouter.countriesList, completion: completion)
    }
}
