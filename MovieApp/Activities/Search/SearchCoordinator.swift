//
//  SearchCoordinator.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation
import UIKit

class SearchCoordinator: Coordinator {
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        
        // Setup  NavigationController Coordinator
        self.navigationController = navigationController
        navigationController.coordinator = self
        
        // Setup  ViewController Coordinator
        let viewController = SearchViewController()
        viewController.coordinator = self
        
        // Setup TabBar
        let tabBarItem = UITabBarItem(title: "Search", image: UIImage(), tag: 3)
        viewController.tabBarItem = tabBarItem
        
        // Setup NavigationBar
        navigationController.navigationBar.prefersLargeTitles = true
        viewController.navigationItem.title = "Search"
        
        navigationController.viewControllers = [viewController]
    }
}
