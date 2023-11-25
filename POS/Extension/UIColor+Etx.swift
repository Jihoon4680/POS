//
//  UIColor+Etx.swift
//  POS
//
//  Created by Jihoon on 2023/11/05.
//

import UIKit

enum PosColor {
    
}

extension UIColor {
    
    class var appBlack: UIColor {
        return UIColor(23, 23, 23)
    }
    
    class var btnBlue: UIColor {
        return UIColor(0, 91, 255)
    }
    //날짜, 시간 표시 뷰 BG
    class var appLightGrey : UIColor {
        return UIColor(65, 75, 86)
    }
    // MainVC CollectionView BackgroundColor
    class var collectionViewBg : UIColor {
        return UIColor(212,214,217)
    }
    // MainVC TableView BackgroundColor
    class var tableViewBg : UIColor {
        return UIColor(240, 244, 246)
    }
    class var tableBorder : UIColor {
        return UIColor(65, 75, 86)
    }
    class var appBlue : UIColor {
        return UIColor(0,91,255)
    }
    class var appGrey : UIColor {
        return UIColor(92,101,114)
    }
    // 주문내역 날짜 색상
    class var appLabelGrey : UIColor {
        return UIColor(65,75,86)
    }
    // 주문하기 버튼 배경색
    class var orderBtnBg : UIColor {
        return UIColor(92,101,114)
    }
    //RGB extension
    convenience init(_ red: Int,_ green: Int,_ blue: Int,_ alpha : CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    
}
