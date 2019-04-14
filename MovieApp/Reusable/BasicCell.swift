//
//  BasicCell.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 13/04/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

class BasicCell: UICollectionViewCell {
    
    override var isHighlighted: Bool {
        didSet {
            var transform: CGAffineTransform = .identity
            if isHighlighted {
                transform = .init(scaleX: 0.9, y: 0.9)
            }
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 3, options: .curveEaseOut, animations: {
                
                self.transform = transform
                
            })
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundView = UIView()
        
        addSubview(self.backgroundView!)
        self.backgroundView?.fillSuperview()
        self.backgroundView?.backgroundColor = .white
        self.backgroundView?.layer.cornerRadius = 16
        
        self.backgroundView?.layer.shadowOpacity = 0.1
        self.backgroundView?.layer.shadowRadius = 10
        self.backgroundView?.layer.shadowOffset = .init(width: 0, height: 10)
        self.backgroundView?.layer.shouldRasterize = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
