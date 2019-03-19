//
//  ViewController.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 19/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, Networking {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        request(target: .nowPlaying(page: 1), success: { (response) in
            print(response.results)
        }) { (error) in
            print(error)
        }
    }


}

