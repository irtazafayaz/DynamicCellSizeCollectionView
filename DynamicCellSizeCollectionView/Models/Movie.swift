//
//  Movie.swift
//  DynamicCellSizeCollectionView
//
//  Created by Irtaza Fiaz on 06/01/2022.
//

import UIKit

struct Movie: Hashable {
    
    let title: String
    let headerImage: UIImage?
    let thumbnail: UIImage?
    let description: String?
    
    let identifier = UUID().uuidString
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(identifier)
    }
    
    init(title: String, headerImage: UIImage? = nil, thumbnail: UIImage? = nil, description: String? = nil) {
        self.title = title
        self.headerImage = headerImage
        self.thumbnail = thumbnail
        self.description = description
    }
    
    static func == (lhs: Movie, rhs: Movie) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
}
