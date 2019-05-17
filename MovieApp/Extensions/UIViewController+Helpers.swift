//
//  UIViewController+Helpers.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 21/04/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

// Helpers to handle Child View Controllers
extension UIViewController {
    func add(_ child: UIViewController) {
        addChild(child)
        view.addSubview(child.view)
        child.didMove(toParent: self)
    }
    
    func remove() {
        guard parent != nil else {
            return
        }
        
        willMove(toParent: nil)
        view.removeFromSuperview()
        removeFromParent()
    }
}
