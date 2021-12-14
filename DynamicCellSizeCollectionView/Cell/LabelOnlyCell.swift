//
//  LabelOnlyCell.swift
//  DynamicCellSizeCollectionView
//
//  Created by Irtaza Fiaz on 14/12/2021.
//

import UIKit

class LabelOnlyCell: UICollectionViewCell {

    @IBOutlet weak var labelHeading: UILabel!
    @IBOutlet weak var parentView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
//        self.parentView.translatesAutoresizingMaskIntoConstraints = false
//        self.parentView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    }

}
