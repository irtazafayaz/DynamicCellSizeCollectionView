//
//  UIImageViewExtension.swift
//  DynamicCellSizeCollectionView
//
//  Created by Irtaza Fiaz on 10/01/2022.
//

import UIKit

extension UIImageView {
    
    func makeRound(borderColor: CGColor? = nil, borderWidth: CGFloat = 2.0) {
        layer.borderColor = borderColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = frame.height / 2.2
        clipsToBounds = true
    }
    
    func addGradientLayer(startColor: CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1).cgColor, endColor: CGColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor, at position: UInt32 = 0) {
        let gradient = CAGradientLayer()
        gradient.frame = bounds
        gradient.colors = [startColor, endColor]
        layer.insertSublayer(gradient, at: position)
    }
    
}
