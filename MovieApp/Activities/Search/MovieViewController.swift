//
//  MovieViewController.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 15/04/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

class MovieViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var movie: Movie! {
        didSet {
            collectionView.reloadData();
        }
    }
    
    enum Section: String, CaseIterable {
        case detail
        case description
        case preview
        case cast
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.registerCellClasses(for: Section.self) { (section) -> UICollectionViewCell.Type in
            switch section {
            case .detail:
                return UICollectionViewCell.self
            case .description:
                return UICollectionViewCell.self
            case .preview:
                return UICollectionViewCell.self
            case .cast:
                return UICollectionViewCell.self
            }
        }
    }
    
    
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 1
//    }
//    
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! SearchCell
//        cell.movie = searchResults[indexPath.row]
//        return cell
//    }
}
