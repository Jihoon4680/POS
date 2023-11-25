//
//  SettingVM.swift
//  POS
//
//  Created by seobe22 on 11/25/23.
//

import Foundation
import UIKit

class SettingVM {
    var data: [MenuModel] = []
    
    init(menuList: [MenuModel]) {
        self.data = menuList
        print(#fileID,#function,#line," jh.ahn -  ")
    }
    
}


//MARK: CollectionView DataSource
extension SettingVM {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return data.filter { $0.menuCategory == 0  }.count
        } else {
            return data.filter { $0.menuCategory == 1 }.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else {
            debugPrint("‼️",#fileID,#function,#line, " is nil ")
            return UICollectionViewCell()
        }
        
        cell.cancelBtn.isHidden = false
        
        let sectionIndex = indexPath.section
        var selectedIndex: Int
        
        switch sectionIndex {
        case 0: // food
            let item = data.filter { $0.menuCategory == 0 }[indexPath.row]
            cell.nameLabel.text = item.menuName
            cell.priceLabel.text = Base.shared.seperateComma(text: "\(item.price)") + "원"
            cell.containerView.backgroundColor = UIColor.menuFoodViewBg
            selectedIndex = indexPath.row
        case 1: // Drink
            let item = data.filter { $0.menuCategory == 1 }[indexPath.row]
            cell.nameLabel.text = item.menuName
            cell.priceLabel.text = Base.shared.seperateComma(text: "\(item.price)") + "원"
            cell.containerView.backgroundColor = UIColor.menuDrinkViewBg
            selectedIndex = indexPath.row
            
        default:
            return UICollectionViewCell()
        }
        
        cell.removeCompletion = {
            self.data = self.data.filter { $0.id != self.data[selectedIndex].id}
            collectionView.reloadData()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MenuHeaderView.identifier, for: indexPath) as? MenuHeaderView else {
            print(#fileID,#function,#line," jh.ahn - <#comment#> ")
            print("header ERror")
            return UICollectionReusableView()
        }
        let sectionIndex = indexPath.section
        
        switch sectionIndex {
        case 0: // 요리
            print(#fileID,#function,#line," jh.ahn - <#comment#> ")
            header.titleLabel.text = "요리"
        case 1: // 주류
            header.titleLabel.text = "주류"
        default:
            header.titleLabel.text = "요리"
        }
        return header
    }
}

//MARK: CollectionView Delegate
extension SettingVM {
}
