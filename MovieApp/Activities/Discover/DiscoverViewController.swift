//
//  DiscoverViewController.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit
import SDWebImage

class DiscoverViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var coordinator: DiscoverCoordinator?
    
    var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData();
        }
    }
    
    let cellId = "DiscoverCell"
    
    init() {
        let layout = SnappingLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        assert(coordinator != nil, "You must set a coordinator before presenting this view controller.")
        setupCollectionView()
        fetchData()
    }

    fileprivate func setupCollectionView() {
        collectionView.backgroundColor = #colorLiteral(red: 0.948936522, green: 0.9490727782, blue: 0.9489068389, alpha: 1)
        collectionView.register(DiscoverCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.contentInset = .init(top: 0, left: 32, bottom: 0, right: 16)
        collectionView.decelerationRate = .fast
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    fileprivate func fetchData() {
        NetworkManager.shared.request(target: .popular(page: 1), success: { (response: MovieResponse) in
            self.movies = response.results
        }) { (err) in
            print(err)
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // show Movie Detail
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DiscoverCell
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: view.frame.height - 200)
    }
    
    
}
