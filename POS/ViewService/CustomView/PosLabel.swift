//
//  PosLabel.swift
//  POS
//
//  Created by Jihoon on 2023/11/04.
//

import Foundation
import UIKit

class PosLabel : UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureHierarchy()
    }
    
    private func configureHierarchy() {
        translatesAutoresizingMaskIntoConstraints = false
        textColor = .black
        // font 초기설정
        font = UIFont.notoSansKR(size: 15, family: .Medium)
        
    }
    // Font Type 설정
    // size 14, Medium 초기 설정
    func setFontType(type : Family, size : CGFloat){
        self.font = UIFont.notoSansKR(size: size, family: type)
    }
    
    

}
