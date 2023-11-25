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
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionIndex = indexPath.section
        
        switch sectionIndex {
        case 0: // food
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else {
                debugPrint("‼️",#fileID,#function,#line, " is nil ")
                return UICollectionViewCell()
            }
            let item = data[indexPath.row]
            cell.menuNameLabel.text = item.menuName
            cell.menuPriceLabel.text = Base.shared.seperateComma(text: "\(item.price)") + "원"
            cell.backgroundColor = UIColor.menuFoodViewBg
            return cell
            
        case 1: // Drink
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else {
                debugPrint("‼️",#fileID,#function,#line, " is nil ")
                return UICollectionViewCell()
            }
            let item = data[indexPath.row]
            cell.menuNameLabel.text = item.menuName
            cell.menuPriceLabel.text = Base.shared.seperateComma(text: "\(item.price)") + "원"
            cell.backgroundColor = UIColor.menuFoodViewBg
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
}
