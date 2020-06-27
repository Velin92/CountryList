//
//  JSONDecoder+decodeResponse.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation
import Alamofire

extension JSONDecoder {
    
  func decodeResponse<T: Decodable>(from response: AFDataResponse<Data>) -> AFResult<T> {
    guard response.error == nil else {
      print(response.error!)
      return .failure(response.error!)
    }

    guard let responseData = response.data else {
        print("didn't get any data from API")
        return .failure(AFError.responseValidationFailed(reason: .dataFileNil))
    }

    do {
      let item = try decode(T.self, from: responseData)
      return .success(item)
    } catch {
        print("error trying to decode response")
        print(error)
        return AFResult.failure(AFError.responseSerializationFailed(reason: .decodingFailed(error: error)))
    }
  }
}
