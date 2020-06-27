//
//  CountriesListResponse.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation

// MARK: - CountriesListResponseElement
struct CountriesListResponseElement: Codable {
    let name: String?
    let topLevelDomain: [String]?
    let alpha2Code, alpha3Code: String?
    let callingCodes: [String]?
    let capital: String?
    let altSpellings: [String]?
    let region, subregion: String?
    let population: Int?
    let latlng: [Double]?
    let demonym: String?
    let area: Double?
    let gini: Double?
    let timezones, borders: [String]?
    let nativeName, numericCode: String?
    let currencies: [Currency]?
    let languages: [Language]?
    let translations: Translations?
    let flag: String?
    let regionalBlocs: [RegionalBloc]?
    let cioc: String?
}

// MARK: - Currency
struct Currency: Codable {
    let code, name, symbol: String?
}

// MARK: - Language
struct Language: Codable {
    let iso6391, iso6392, iso6393, iso6394, iso6395, iso6396, name, nativeName: String?

    enum CodingKeys: String, CodingKey {
        case iso6391 = "iso639_1"
        case iso6392 = "iso639_2"
        case iso6393 = "iso639_3"
        case iso6394 = "iso639_4"
        case iso6395 = "iso639_5"
        case iso6396 = "iso639_6"
        case name, nativeName
    }
}

// MARK: - RegionalBloc
struct RegionalBloc: Codable {
    let acronym, name: String?
    let otherAcronyms, otherNames: [String]?
}

// MARK: - Translations
struct Translations: Codable {
    let de, es, fr, ja: String?
    let it, br, pt: String?
}

typealias CountriesListResponse = [CountriesListResponseElement]

