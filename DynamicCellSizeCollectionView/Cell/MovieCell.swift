//
//  MovieCell.swift
//  DynamicCellSizeCollectionView
//
//  Created by Irtaza Fiaz on 10/01/2022.
//

import UIKit

protocol MovieCell: UICollectionViewCell {
    func showMovie(movie: Movie?)
}
