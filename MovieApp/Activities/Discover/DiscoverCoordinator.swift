//
//  DiscoverCoordinator.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation
import UIKit

class DiscoverCoordinator: Coordinator {
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self
        
        let viewController = DiscoverViewController()
        let tabBarItem = UITabBarItem(title: "Discover", image: UIImage(), tag: 1)
        viewController.tabBarItem = tabBarItem
        navigationController.isNavigationBarHidden = true
        viewController.coordinator = self
        navigationController.viewControllers = [viewController]
    }
}
