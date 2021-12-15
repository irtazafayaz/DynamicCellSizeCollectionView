//
//  ViewController.swift
//  DynamicCellSizeCollectionView
//
//  Created by Irtaza Fiaz on 14/12/2021.
//

import UIKit

class ViewController: UIViewController {

    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupNavigationBarTitleView()
    }
    
    func setupNavigationBarTitleView() {
        let logo = UIImage(named: "logo-navbar")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
   


}

