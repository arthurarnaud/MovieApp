//
//  MainTabBarController.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {

    let discover = DiscoverCoordinator()
    let nowPlaying = NowPlayingCoordinator()
    let search = SearchCoordinator()
    let upcoming = UpcomingCoordinator()
    let account = AccountCoordinator()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = #colorLiteral(red: 0.8073012829, green: 0.03132232279, blue: 0.1439771354, alpha: 1)
        tabBar.barTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        viewControllers = [discover.navigationController, nowPlaying.navigationController, search.navigationController, upcoming.navigationController, account.navigationController]
    }

}
