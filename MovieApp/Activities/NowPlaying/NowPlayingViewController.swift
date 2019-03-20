//
//  NowPlayingViewController.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

class NowPlayingViewController: UIViewController {
    
    var coordinator: NowPlayingCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")
        view.backgroundColor = .blue
    }
    
}
