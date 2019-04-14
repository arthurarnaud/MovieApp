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
    
    private var movies: [Movie] = [] {
        didSet {
            collectionView.reloadData();
        }
    }
    
    private let cellId = "DiscoverCell"
    
    private var movieDetailController: MovieDetailViewController!
    private var anchoredConstraints: AnchoredConstraints?
    private var startingFrame: CGRect?
    
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
        showMovieDetailFullscreen(indexPath: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! DiscoverCell
        cell.movie = movies[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: view.frame.width - 64, height: view.frame.height - 200)
    }
    
    fileprivate func setupSingleAppFullscreenController(_ indexPath: IndexPath) {
        let movieDetailController = MovieDetailViewController()
        //movieDetailController.todayItem = items[indexPath.row]
//        movieDetailController.dismissHandler = {
//            self.handleAppFullscreenDismissal()
//        }
        
        movieDetailController.view.layer.cornerRadius = 16
        self.movieDetailController = movieDetailController
        
//        // #1 setup our pan gesture
//        let gesture = UIPanGestureRecognizer(target: self, action: #selector(handleDrag))
//        gesture.delegate = self
//        movieDetailController.view.addGestureRecognizer(gesture)
//
//        // #2 add a blue effect view
//
//        // #3 not to interfere with our UITableView scrolling
    }
    
    fileprivate func setupStartingCellFrame(_ indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) else { return }
        
        // absolute coordindates of cell
        guard let startingFrame = cell.superview?.convert(cell.frame, to: nil) else { return }
        
        self.startingFrame = startingFrame
    }
    
    fileprivate func setupAppFullscreenStartingPosition(_ indexPath: IndexPath) {
        let fullscreenView = movieDetailController.view!
        view.addSubview(fullscreenView)
        
        addChild(movieDetailController)
        
        self.collectionView.isUserInteractionEnabled = false
        
        setupStartingCellFrame(indexPath)
        
        guard let startingFrame = self.startingFrame else { return }
        
        // auto layout constraint animations
        // 4 anchors
        
        self.anchoredConstraints = fullscreenView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: startingFrame.origin.y, left: startingFrame.origin.x, bottom: 0, right: 0), size: .init(width: startingFrame.width, height: startingFrame.height))
        
        self.view.layoutIfNeeded()
    }
    
    fileprivate func beginAnimationAppFullscreen() {
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: .curveEaseOut, animations: {
            
            //self.blurVisualEffectView.alpha = 1
            
            self.anchoredConstraints?.top?.constant = 0
            self.anchoredConstraints?.leading?.constant = 0
            self.anchoredConstraints?.width?.constant = self.view.frame.width
            self.anchoredConstraints?.height?.constant = self.view.frame.height
            
            self.view.layoutIfNeeded()
            
            self.tabBarController?.tabBar.transform = CGAffineTransform(translationX: 0, y: 100)
            
//            guard let cell = self.appFullscreenController.tableView.cellForRow(at: [0, 0]) as? MovieDetailViewController else { return }
//
//            cell.todayCell.topConstraint.constant = 48
//            cell.layoutIfNeeded()
            
            
        }, completion: nil)
    }
    
    fileprivate func showMovieDetailFullscreen(indexPath: IndexPath) {
        setupSingleAppFullscreenController(indexPath)
        setupAppFullscreenStartingPosition(indexPath)
        beginAnimationAppFullscreen()
    }
}
