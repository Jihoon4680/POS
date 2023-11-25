//
//  MenuCollectionView.swift
//  POS
//
//  Created by Jihoon on 2023/11/25.
//

import UIKit

class MenuCollectionView: UICollectionView {
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame : frame, collectionViewLayout : layout)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        configure()
    }
    
    enum MenuSectionLayoutKind : Int {
        // 이것도 고민해봐야함 ( 현재 요리와 주류만 설정 )
        case cook
        case drink
        
        var sectionNum : Int { // 몇번째 섹션인지
            switch self {
            case .cook:
                return 0
            case .drink:
                return 1
            }
        }
        
        var columnCount: Int { // 열 설정 ( 한 행에 몇 열이 생성 될지 )
            switch self {
            case .cook:
                return 4
            case .drink:
                return 4
            }
        }
        
        var sectionStr : String { // 섹션 이름 설정
            switch self {
            case .cook:
                return "요리"
            case .drink:
                return "주류"
            }
        }
    
    }
    
}

extension MenuCollectionView {
    
    private func configure(){
        
    }
    
    class func createLayout() -> UICollectionViewLayout{
        let layout = UICollectionViewCompositionalLayout {
            (sectionIndex: Int, layoutEnvironment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            guard let layoutKind = MenuSectionLayoutKind(rawValue: sectionIndex) else { return nil }
            let sectionNum = layoutKind.sectionNum // 어느 섹션인지
            let columns = layoutKind.columnCount // 한줄에 몇개 넣는지

            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2),
                                   heightDimension: .fractionalHeight(1.0))


            let item = NSCollectionLayoutItem(layoutSize: itemSize)

            let itemInset = NSDirectionalEdgeInsets(top: 24, leading: 24, bottom: 24, trailing: 24)
            item.contentInsets = itemInset

            let groupHeight =  NSCollectionLayoutDimension.fractionalHeight(0.25)
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
