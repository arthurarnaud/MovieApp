//
//  AccountCoordinator.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation
import UIKit

class AccountCoordinator: Coordinator {
    var navigationController: CoordinatedNavigationController
    
    init(navigationController: CoordinatedNavigationController = CoordinatedNavigationController()) {
        self.navigationController = navigationController
        navigationController.coordinator = self
        
        let viewController = AccountViewController()
        let tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "account"), tag: 3)
        tabBarItem.imageInsets = UIEdgeInsets(top: 9, left: 0, bottom: -9, right: 0)
        viewController.tabBarItem = tabBarItem
        viewController.coordinator = self
        navigationController.viewControllers = [viewController]
    }
}
