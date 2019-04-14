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
        viewControllers = [discover.navigationController, nowPlaying.navigationController, search.navigationController, upcoming.navigationController, account.navigationController]
    }

}
