//
//  UIButton+Ext.swift
//  POS
//
//  Created by Jihoon on 11/23/23.
//

import Foundation
import UIKit

extension UIButton {

    func setFontType(type : Family, size : CGFloat){
        self.titleLabel?.font = UIFont.notoSansKR(size: size, family: type)
    }

}
