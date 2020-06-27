//
//  LoaderDisplayer.swift
//  CountryList
//
//  Created by Mauro Romito on 27/06/2020.
//  Copyright © 2020 Mauro Romito. All rights reserved.
//

import Foundation
import UIKit

protocol LoaderDisplayer where Self: UIViewController {
    func showLoader()
    func hideLoader()
}

extension LoaderDisplayer {
    func showLoader() {
        DispatchQueue.main.async {
            let maskView = UIView(frame: self.view.frame)
            self.view.addSubview(maskView)
            let bgView = UIView(frame: CGRect.init(x: 0, y: 0, width: 100, height: 100))
            bgView.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.6)
            bgView.layer.cornerRadius = 10
            let activityView = UIActivityIndicatorView(style: .large)
            activityView.center = bgView.center
            bgView.addSubview(activityView)
            bgView.center = self.view.center
            self.view.addSubview(bgView)
            activityView.startAnimating()
            maskView.tag = String(describing: self).hashValue
            maskView.addSubview(bgView)
        }
    }
    
    func hideLoader() {
        DispatchQueue.main.async {
            if let maskView = self.view.subviews.first (where: {$0.tag == String(describing: self).hashValue}) {
                maskView.removeFromSuperview()
            }
        }
    }
}
