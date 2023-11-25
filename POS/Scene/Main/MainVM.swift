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
            cell.backgroundColor = .white
            if indexPath.row == 0 {
                print(#fileID,#function,#line," jh.ahn - \(orderOptionStr[indexPath.row]) ")
                cell.titleLabel.textColor = .white
                cell.backgroundColor = .appBlack
            }
            cell.titleLabel.text = orderOptionStr[indexPath.row]
            return cell
            
        case 1: // Table
                guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TableCollectionViewCell.identifier, for: indexPath) as? TableCollectionViewCell else {
                    debugPrint("‼️",#fileID,#function,#line, " is nil ")
                    return UICollectionViewCell()
                }
            cell.tableNumLabel.text = "\(indexPath.row + 1)"
            cell.menuListSV.addArrangedSubview(MenuSV.getInstance(menuName: "첫번째", menuCount: "12"))
            cell.menuListSV.addArrangedSubview(MenuSV())
            cell.menuListSV.addArrangedSubview(MenuSV())
            return cell
        default:
            return UICollectionViewCell()
        }
        
    }
}

//MARK: CollectionView Delegate
extension MainVM {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let sectionIndex = indexPath.section
        
        switch sectionIndex {
        case 0: // OrderOption
            guard let cell = collectionView.cellForItem(at: indexPath) as? OrderOptionCollectionViewCell else {
                debugPrint("‼️",#fileID,#function,#line, " is nil ")
                return
            }
            switch indexPath.row {
            case 0: // 테이블
                print("테이블 선택")
            case 1: // 주문내역
                print("주문내역")
            case 2: // 설정
                print("설정")
            default: // 테이블
                print("테이블 선택")
            }
            
        case 1: // Table
                guard let cell = collectionView.cellForItem(at: indexPath) as? TableCollectionViewCell else {
                    debugPrint("‼️",#fileID,#function,#line, " is nil ")
                    return
                }
            print("indexpath.row \(indexPath.row)")
            let vc = OrderVC.getInstance(tableNum: indexPath.row + 1)
            SceneManager.shared.pushVC(vc: vc)
       
        default:
            return
        }
    }
}
