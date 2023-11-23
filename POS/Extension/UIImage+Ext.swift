//
//  UIImage+Ext.swift
//  POS
//
//  Created by Jihoon on 2023/11/16.
//

import Foundation
import UIKit

extension UIImage {
    
    class var optionImg : UIImage  {
        guard let image = UIImage(systemName: "gearshape") else {
            debugPrint( #fileID,#function,#line," ‼️ is nil ")
            return UIImage()
        }
        return image
     }
    
    class var closeImg: UIImage {
        guard let image = UIImage(systemName: "xmark") else {
            debugPrint( #fileID,#function,#line," ‼️ is nil ")
            return UIImage()
        }
        return image
    }
}
