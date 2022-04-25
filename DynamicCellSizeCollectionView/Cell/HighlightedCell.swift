//
//  HighlightedCell.swift
//  DynamicCellSizeCollectionView
//
//  Created by Irtaza Fiaz on 07/01/2022.
//

import UIKit

class HighlightedCell: UICollectionViewCell, MovieCell {
    
    static var reuseIdentifier = String(describing: HighlightedCell.self)
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var button: UIButton!

    func showMovie(movie: Movie?) {
        image.image = movie?.headerImage
        button.setTitle(movie?.description, for: .normal)
    }

}
