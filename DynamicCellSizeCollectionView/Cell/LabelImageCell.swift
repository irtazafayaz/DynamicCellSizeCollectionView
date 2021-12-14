//
//  LabelImageCell.swift
//  DynamicCellSizeCollectionView
//
//  Created by Irtaza Fiaz on 14/12/2021.
//

import UIKit

class LabelImageCell: UICollectionViewCell {

    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var parentView: UIView!
    @IBOutlet weak var labelDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
//        self.parentView.translatesAutoresizingMaskIntoConstraints = false
//        self.parentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }

}
