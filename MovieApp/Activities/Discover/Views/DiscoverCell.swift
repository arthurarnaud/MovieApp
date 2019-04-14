//
//  DiscoverCell.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 21/03/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

class DiscoverCell: BasicCell {
    
    var todayItem: Movie! {
        didSet {
//            imageView.image = todayItem.image
        }
    }
    
    let titleLabel = UILabel(text: "Movie Name", font: .boldSystemFont(ofSize: 28))
    
    let imageView = UIImageView()
    
    var topConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        layer.cornerRadius = 16
        
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        let imageContainerView = UIView()
        imageContainerView.addSubview(imageView)
        imageView.centerInSuperview(size: .init(width: 240, height: 240))
        
        let stackView = VerticalStackView(arrangedSubviews: [titleLabel, imageContainerView], spacing: 8)
        addSubview(stackView)
        
//        stackView.anchor(top: nil, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 0, left: 24, bottom: 24, right: 24))
//        self.topConstraint = stackView.topAnchor.constraint(equalTo: topAnchor, constant: 24)
//        self.topConstraint.isActive = true
        
        stackView.fillSuperview(padding: .init(top: 24, left: 24, bottom: 24, right: 24))
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
}
