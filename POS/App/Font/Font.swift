//
//  Font.swift
//  POS
//
//  Created by Jihoon on 2023/11/05.
//

import Foundation
import UIKit

enum Family: String {
    case Black,
         Bold,
         ExtraBold,
         ExtraLight,
         Light,
         Medium,
         Regular,
         SemiBold
}

extension UIFont {
    //MARK: 프로젝트 내 Font 이름 확인
    static func checkFontName(){
        UIFont.familyNames.sorted().forEach { familyName in
            print("*** \(familyName) ***")
            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                print("\(fontName)")
            }
            print("---------------------")
        }
    }
    //MARK: notoSansKR 폰트 처리 
    static func notoSansKR(size: CGFloat = 10, family: Family = .Regular) -> UIFont? {
        return UIFont(name: "NotoSansKR-\(family)", size: size)
    }
}

