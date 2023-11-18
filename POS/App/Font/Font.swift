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
    static func checkFontName(){
        UIFont.familyNames.sorted().forEach { familyName in
            print("*** \(familyName) ***")
            UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
                print("\(fontName)")
            }
            print("---------------------")
        }
    }
    
    static func notoSansKR(size: CGFloat = 10, family: Family = .Regular) -> UIFont? {
        return UIFont(name: "NotoSansKR-\(family)", size: size)
    }
}

