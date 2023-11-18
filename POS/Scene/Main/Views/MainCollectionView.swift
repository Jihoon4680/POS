
//
//  MainView.swift
//  POS
//
//  Created by Jihoon on 2023/10/30.
////

import Foundation
import UIKit

class MainCollectionView : UIView {
    
    enum SectionLayoutKind : Int {
        case option
        case table
        
        var columnCount: Int {
            switch self {
            case .option:
                return 3

            case .table:
                return 10
            }
        }
    }
    
    lazy var collectionView : UICollectionView = {
        let collectionView = UICollectionView(frame: .zero)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    lazy var dataSource : UICollectionViewDiffableDataSource<SectionLayoutKind, Int>! = nil

    override init(frame : CGRect){
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        configure()
        
    }
 
}
//MARK: - Hierarchy
extension MainCollectionView {
    
    private func configure(){
        self.backgroundColor = .systemBackground
        
        collectionView = UICollectionView(frame: bounds, collectionViewLayout: createLayout())
        
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func createLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let layoutKind = SectionLayoutKind(rawValue: sectionIndex) else { return nil }
            
            let columns = layoutKind.columnCount
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
            
            let groupHeight = layoutKind == .option ?
            NSCollectionLayoutDimension.absolute(42) : NSCollectionLayoutDimension.fractionalWidth(0.2)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: groupHeight)
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: columns)
            
            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = NSDirectionalEdgeInsets(top: 20, leading: 20, bottom: 20, trailing: 20)
            return section
        }
        return layout
    }
}





#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MainView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        MainCollectionView()
            .getPreview()
            .previewLayout(.sizeThatFits)
            .ignoresSafeArea()
    }
}
#endif

