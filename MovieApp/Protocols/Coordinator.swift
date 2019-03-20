//
//  Coordinator.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import Foundation

/// Used to dictate the basics of all coordinators in the app.
protocol Coordinator: AnyObject {
    var navigationController: CoordinatedNavigationController { get set }
}
