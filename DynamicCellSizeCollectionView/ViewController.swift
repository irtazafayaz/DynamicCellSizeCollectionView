//
//  ViewController.swift
//  DynamicCellSizeCollectionView
//
//  Created by Irtaza Fiaz on 14/12/2021.
//

import UIKit

class ViewController: UIViewController {
    
    
    var model = [Model]()
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        setupCollectionView()
    }
    
    func setupData() {
        
        
        model.append(Model(imgName: "", description: Constants.smallText.rawValue))
        model.append(Model(imgName: "ic_big", description: Constants.longText.rawValue))
        model.append(Model(imgName: "", description: Constants.smallText.rawValue))
        model.append(Model(imgName: "ic_small", description: Constants.smallText.rawValue))
        model.append(Model(imgName: "", description: Constants.longText.rawValue))
        model.append(Model(imgName: "ic_big", description: Constants.smallText.rawValue))
        
    }
    
    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "LabelOnlyCell", bundle: nil), forCellWithReuseIdentifier: "LabelOnlyCell")
        collectionView.register(UINib(nibName: "LabelImageCell", bundle: nil), forCellWithReuseIdentifier: "LabelImageCell")
        if let collectionViewLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            collectionViewLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }
    
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "LabelOnlyCell", for: indexPath) as? LabelOnlyCell else {
            return LabelOnlyCell()
        }
        cell.labelHeading.text = model[indexPath.row].description
        return cell 
    }
    
    
}

