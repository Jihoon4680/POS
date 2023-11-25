//
//  SettingCollectionView.swift
//  POS
//
//  Created by seobe22 on 11/25/23.
//

import UIKit
class SettingCollectionView: UICollectionView {
    
    enum SectionLayoutKind: Int {
        case food
        case drink
        
        var sectionNum: Int {
            switch self {
            case .food:
                return 0
            case .drink:
                return 1
            }
        }
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        
    }
    
    class func layout() -> UICollectionViewFlowLayout {
        let cvLayout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        cvLayout.minimumLineSpacing = 16
        cvLayout.minimumInteritemSpacing = 11
        cvLayout.sectionInset = UIEdgeInsets(top: 8, left: 24, bottom: 14, right: 24)
        cvLayout.itemSize = CGSize(width: 169, height: 137)
        return cvLayout
    }
}

