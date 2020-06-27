//
//  Storyboarded.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation
import UIKit

protocol Storyboarded where Self: UIViewController {
    
    static var storyboardName: String {get}
    static var storyboardId: String {get}
    
    static func instantiate() -> Self
}

extension Storyboarded {
    static func instantiate() -> Self {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let vc = storyboard.instantiateViewController(identifier: storyboardId) as? Self else {
            fatalError("Invalid controller class")
        }
        return vc
    }
}
