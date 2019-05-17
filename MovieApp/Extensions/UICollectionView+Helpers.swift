//
//  UICollectionView+Helpers.swift
//  MovieApp
//
//  Created by Arthur ARNAUD on 20/04/2019.
//  Copyright © 2019 Arthur ARNAUD. All rights reserved.
//

import UIKit

extension UICollectionView {
    func registerCellClasses<T: CaseIterable & RawRepresentable>(
        for sectionType: T.Type,
        using resolver: (T) -> UICollectionViewCell.Type
        ) where T.RawValue == String {
        for section in sectionType.allCases {
            register(resolver(section), forCellWithReuseIdentifier: section.rawValue)
        }
    }
}
