//
//  MainCoordinator.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation
import UIKit

class MainCoordinator {
    
    private weak var navigationController : UINavigationController!
    var child: Coordinator?
    
    init(navigationController : UINavigationController) {
        self.navigationController  = navigationController
    }
}

extension MainCoordinator: Coordinator {
    
    func start() {
        let interactor = CountriesListInteractor(apiClient: APIClient())
        let vc = CountriesListViewController.instantiate()
        let presenter = CountriesListPresenter(interactor: interactor, view: vc)
        vc.presenter = presenter
        navigationController.pushViewController(vc, animated: false)
    }
}
