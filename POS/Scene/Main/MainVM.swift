//
//  MainView.swift
//  POS
//
//  Created by Jihoon on 2023/11/11.
//

import Foundation
import UIKit

class MainVM {
    
    init() {
        print(#fileID,#function,#line," jh.ahn -  ")
    }
    
}


//MARK: CollectionView DataSource
extension MainVM {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let sectionIndex = indexPath.section
        
        switch sectionIndex {
        case 0: // OrderOption
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: OrderOptionCollectionViewCell.identifier, for: indexPath) as? OrderOptionCollectionViewCell else {
                debugPrint("‼️",#fileID,#function,#line, " is nil ")
                return UICollectionViewCell()
            }
            cell.titleLabel.text = orderOptionStr[indexPath.row]
            
            return cell
        case 1: // Table
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.identifier, for: indexPath) as? TableCollectionViewCell else {
                    debugPrint("‼️",#fileID,#function,#line, " is nil ")
                    return UICollectionViewCell()
                }
            cell.tableNumLabel.text = "\(indexPath.row)"
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
}

//MARK: CollectionView Delegate
extension MainVM {
    
}
