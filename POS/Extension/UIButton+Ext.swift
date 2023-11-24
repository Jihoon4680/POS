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
    
    func setMinusImage(){
        let img = UIImage(named: "minus_btn")
        self.setImage(img, for: .normal)
    }
    func setPlusImage(){
        let img = UIImage(named: "plus_btn")
        self.setImage(img, for: .normal)
    }
    
    func setCheckBoxImage(){
        let imgDefault = UIImage(named: "checkbox_default")
        let imgActive = UIImage(named: "checkbox_active")
        self.setImage(imgDefault, for: .normal)
        self.setImage(imgActive, for: .selected)
    }

}
