//
//  SearchCell.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 14/04/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

class SearchCell: UICollectionViewCell {
    
    var movie: Movie! {
        didSet {
            imageView.sd_setImage(with: NetworkManager.shared.getImageURL(for: movie.posterPath ?? ""), completed: nil)
            titleLabel.text = movie.title
            ratingsLabel.text = "\(movie.voteAverage)"
            overviewLabel.text = movie.overview
        }
    }
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.widthAnchor.constraint(equalToConstant: 100).isActive = true
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.layer.shadowOpacity = 0.5
        iv.layer.shadowRadius = 10
        iv.layer.shadowOffset = .init(width: 0, height: 10)
        iv.layer.shouldRasterize = true
        return iv
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Title"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 22, weight: .heavy)
        label.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return label
    }()
    
    private let ratingsLabel: UILabel = {
        let label = UILabel()
        label.text = "4,3"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 20, weight: .medium)
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        return label
    }()
    
    private let overviewLabel: UILabel = {
        let label = UILabel()
        label.text = "Description"
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 12, weight: .light)
        label.numberOfLines = 4
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
    }
    
    fileprivate func setupLayout() {
        layer.cornerRadius = 16
        clipsToBounds = true
        
        let infoStackView = VerticalStackView(arrangedSubviews: [titleLabel, ratingsLabel, overviewLabel])
        infoStackView.distribution = .fill
        
        let searchResultStackView = UIStackView(arrangedSubviews: [imageView, infoStackView])
        searchResultStackView.spacing = 20
        addSubview(searchResultStackView)
        searchResultStackView.fillSuperview(padding: .init(top: 8, left: 0, bottom: 8, right: 0))
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
