//
//  APIRouter.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPHeaderField: String {
  case authentication = "Authorization"
  case contentType = "Content-Type"
  case acceptType = "Accept"
  case acceptEncoding = "Accept-Encoding"
}

enum ContentType: String {
  case json = "application/json"
}

enum APIConstants {
    static let baseURLPath = "https://restcountries.eu/rest/v2"
}

enum APIRouter: URLRequestConvertible {
    case countriesList
    
    var method: HTTPMethod {
        switch self {
        case .countriesList:
            return .get
        }
    }
    
    var path: String {
        
        switch self {
        case .countriesList:
            return "/all"
        }
    }
    
    var encoding: ParameterEncoding {
        switch method {
        case .get:
            return URLEncoding.default
        default:
            return JSONEncoding.default
        }
    }
    
    public func asURLRequest() throws -> URLRequest {
        let url = try APIConstants.baseURLPath.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        
        // HTTP Method
        urlRequest.httpMethod = method.rawValue
        
        // Common Headers
        urlRequest.setValue(ContentType.json.rawValue, forHTTPHeaderField: HTTPHeaderField.contentType.rawValue)
        
        if method == .post {
            let codable: Any = getConcreteCodables()
            do {
                urlRequest.httpBody = try JSONSerialization.data(withJSONObject: codable, options: .prettyPrinted)
            }
            catch {
                throw AFError.parameterEncodingFailed(reason: .jsonEncodingFailed(error: error))
            }
            return urlRequest
            
        } else {
            switch self {
            case .countriesList:
                break
            }
            print("GET request url\n: \(String(describing: urlRequest.url?.absoluteString))")
            return urlRequest
        }
    }
    
    private func getConcreteCodables() -> Any {
        switch self {
        default:
            fatalError("Not required")
        }
    }
}
