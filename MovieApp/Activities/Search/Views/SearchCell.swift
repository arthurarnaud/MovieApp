//
//  SearchCell.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 14/04/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

class SearchCell: BasicCell {
    
    var movie: Movie! {
        didSet {
//            imageView.sd_setImage(with: NetworkManager.shared.getImageURL(for: movie.posterPath), completed: nil)
            informationLabel.text = movie.title
        }
    }
    
    private let informationLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
        
    }
    
    fileprivate func setupLayout() {
        layer.cornerRadius = 16
        clipsToBounds = true
//
//        imageView.contentMode = .scaleAspectFill
//        addSubview(imageView)
//        imageView.fillSuperview()
        
        
        addSubview(informationLabel)
        informationLabel.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 16, bottom: 16, right: 16))
        informationLabel.font = UIFont.monospacedDigitSystemFont(ofSize: 34, weight: .heavy)
        informationLabel.numberOfLines = 0
        
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
