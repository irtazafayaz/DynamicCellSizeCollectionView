//
//  ViewController.swift
//  DynamicCellSizeCollectionView
//
//  Created by Irtaza Fiaz on 14/12/2021.
//

import UIKit

typealias MoviesDataSource = UICollectionViewDiffableDataSource<MovieManager.Section, Movie>

class MovieFeedViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var dataSource: MoviesDataSource!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    func setupView() {
        setupNavigationBarTitleView()
        collectionView.collectionViewLayout = setupCollectionViewLayout()
        createDataSource()
        createSnapshot()
    }
    
    func setupNavigationBarTitleView() {
        let logo = UIImage(named: "logo-navbar")
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
}

extension MovieFeedViewController {
    
    func setupCollectionViewLayout() -> UICollectionViewLayout {
        let sectionProvider = { (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            var section: NSCollectionLayoutSection?
            switch sectionIndex {
            case 0:
                section = self.getHeaderSection()
            case 1:
                section = self.getPreviewSection()
            default:
                section = self.getPreviewSection()
            }
            return section
        }
        return UICollectionViewCompositionalLayout(sectionProvider: sectionProvider)
    }
    
    func getHeaderSection() -> NSCollectionLayoutSection? {
        
        //TODO: :::::: Need to Calculate Size based on Image Size and Button Height :::::: //
        
        // Define an Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        // Define a group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Define a section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    func getPreviewSection() -> NSCollectionLayoutSection? {
        
        //TODO: :::::: Need to Calculate Size based on Image Size and Button Height :::::: //
        
        // Define an Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        // Define a group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.3), heightDimension: .fractionalHeight(0.2))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
        
        // Define a section
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    func createDataSource() {
        dataSource = MoviesDataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, movie: Movie) -> UICollectionViewCell? in
            
            let reuseIdentifier: String
            
            switch indexPath.section {
            case 0: reuseIdentifier = HighlightedCell.reuseIdentifier
            case 1: reuseIdentifier = PreviewCell.reuseIdentifier
            default: reuseIdentifier = PreviewCell.reuseIdentifier
            }
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? MovieCell else {
                return nil
            }
            let section = MovieManager.Section.allCases[indexPath.section]
            let movie = MovieManager.movies[section]?[indexPath.item]
            cell.showMovie(movie: movie)
            return cell
        }
    }
    
    func createSnapshot() {
        var currentSnapshot = NSDiffableDataSourceSnapshot<MovieManager.Section, Movie>()
        
        MovieManager.Section.allCases.forEach { section in
            currentSnapshot.appendSections([section])
            if let movies = MovieManager.movies[section] {
                currentSnapshot.appendItems(movies, toSection: section)
            }
        }
        dataSource.apply(currentSnapshot, animatingDifferences: false)
    }
    
    
    
}

