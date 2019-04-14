//
//  UpcomingCoordinator.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation
import UIKit

class UpcomingCoordinator: Coordinator {
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self
        
        let viewController = UpcomingViewController()
        let tabBarItem = UITabBarItem(title: "Upcomming", image: UIImage(), tag: 3)
        viewController.tabBarItem = tabBarItem
        viewController.coordinator = self
        navigationController.viewControllers = [viewController]
    }
}
