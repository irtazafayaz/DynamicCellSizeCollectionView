//
//  PreviewCell.swift
//  DynamicCellSizeCollectionView
//
//  Created by Irtaza Fiaz on 10/01/2022.
//

import UIKit

class PreviewCell: UICollectionViewCell, MovieCell {
    
    static let reuseIdentifier = String(describing: PreviewCell.self)
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    private var addGradient: Bool = false
    
    func showMovie(movie: Movie?) {
        image.makeRound(borderColor: UIColor.white.cgColor)
        if !addGradient {
            image.addGradientLayer()
            addGradient = true
        }
        image.image = movie?.thumbnail
        label.text = movie?.title
    }
    
}
