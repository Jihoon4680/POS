//
//  File.swift
//  POS
//
//  Created by Jihoon on 11/24/23.
//

import Foundation
import UIKit

class OrderVM {
    
    var tableNum = 0 // 테이블번호
    var orderMenuList = 0 // 주문 메뉴 목록
    /* 주문목록
     [
        메뉴 이름,
        메뉴 가격,
        메뉴 수량,
        메뉴 총 가격,
     ]
     */
    // 테이블 당 총 주문 수량 -> 이걸 저장해
    struct OrderedList {
        let tableNum : Int
        var orderedMenu : [OrderedMenu]
    }
    
    struct OrderedMenu {
        let menuName : String
        let menuPrice : Int
        var menuTotalPrice : Int
        var menuTotalCount : Int
    }
    
    init() {
        print(#fileID,#function,#line," jh.ahn -  ")
    }

}


//MARK: CollectionView DataSource
extension OrderVM {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return 10
        } else {
            return 3
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
        let sectionIndex = indexPath.section
        
        switch sectionIndex {
        case 0: // OrderOption
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else {
                debugPrint("‼️",#fileID,#function,#line, " is nil ")
                return UICollectionViewCell()
            }
            cell.containerView.backgroundColor = .menuFoodViewBg
            cell.nameLabel.text = "제육볶음"
            cell.priceLabel.text = Base.shared.seperateComma(text: "10000") + "원"
            return cell
            
        case 1: // Table
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as? MenuCollectionViewCell else {
                debugPrint("‼️",#fileID,#function,#line, " is nil ")
                return UICollectionViewCell()
            }
            cell.containerView.backgroundColor = .menuDrinkViewBg
            cell.nameLabel.text = "제육볶음"
            cell.priceLabel.text = Base.shared.seperateComma(text: "10000") + "원"
            
            return cell
        default:
            return UICollectionViewCell()
        }
   
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MenuHeaderView.identifier, for: indexPath) as? MenuHeaderView else {
            print(#fileID,#function,#line," jh.ahn - <#comment#> ")
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
extension OrderVM {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath){
        let sectionIndex = indexPath.section
        guard let cell = collectionView.cellForItem(at: indexPath) as? OrderOptionCollectionViewCell else {
            debugPrint("‼️",#fileID,#function,#line, " is nil ")
            return
        }
        switch sectionIndex {
        case 0: // OrderOption
           
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
            
            let tableNum = indexPath.row + 1
            let vc = OrderVC.getInstance(tableNum: tableNum)
            SceneManager.shared.pushVC(vc: vc)
       
        default:
            return
        }
    }
}
