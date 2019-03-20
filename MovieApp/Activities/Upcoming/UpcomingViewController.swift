//
//  UpcomingViewController.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

class UpcomingViewController: UIViewController {
    
    var coordinator: UpcomingCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")
        view.backgroundColor = .green
    }
    
}
