//
//  Coordinator.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation

protocol Coordinator: AnyObject {
    var child: Coordinator? { get }
    func start()
}
