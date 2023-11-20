
//
//  MainView.swift
//  POS
//
//  Created by Jihoon on 2023/10/30.
////

import Foundation
import UIKit


class MainCollectionView : UICollectionView {
    
    enum SectionLayoutKind : Int {
        case orderOption
        case table
        
        var sectionNum : Int {
            switch self {
            case .orderOption:
                return 0
            case .table:
                return 1
            }
        }
        
        var columnCount: Int {
            switch self {
            case .orderOption:
                return 3
            case .table:
                return 5
            }
        }
    }

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        configure()
        
    }
 
}
//MARK: - UI
extension MainCollectionView {
    
    private func configure(){
        self.backgroundColor = UIColor.collectionViewBg
        
//        NSLayoutConstraint.activate([
//            collectionView.topAnchor.constraint(equalTo: topAnchor),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor)
//        ])
    }
    //MARK: CollectnionView layout을 MainVC에서 사용하기위해 Class 함수 적용
    
    class func createLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let layoutKind = SectionLayoutKind(rawValue: sectionIndex) else { return nil }
            let sectionNum = layoutKind.sectionNum // 어느 섹션인지
            let columns = layoutKind.columnCount // 한줄에 몇개 넣는지
            
            let itemSize = sectionNum == 0 ?
            NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.165),
                                   heightDimension: .fractionalHeight(1.0)) :
            NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                   heightDimension: .fractionalHeight(1.0))
            
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let itemInset = sectionNum == 0 ?
            NSDirectionalEdgeInsets(top: 0, leading: 12, bottom: 0, trailing: 6) :
            NSDirectionalEdgeInsets(top: 12, leading: 12, bottom: 12, trailing: 12)
            item.contentInsets = itemInset
            
            let groupHeight = columns == 3 ?
            NSCollectionLayoutDimension.fractionalHeight(0.07) :
            NSCollectionLayoutDimension.fractionalHeight(0.255)
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                   heightDimension: groupHeight)
            print(#fileID,#function,#line," jh.ahn - groupheight : \(groupHeight) ")
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: columns)

            let section = NSCollectionLayoutSection(group: group)
            section.contentInsets = columns == 3 ?  NSDirectionalEdgeInsets(top: 24, leading: 24, bottom: 20, trailing: 24) : NSDirectionalEdgeInsets(top: 20, leading: 24, bottom: 24, trailing: 24)
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

