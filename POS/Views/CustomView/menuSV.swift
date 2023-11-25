//
//  menuSV.swift
//  POS
//
//  Created by Jihoon on 11/24/23.
//

import Foundation
import UIKit

class MenuSV : UIStackView {

    lazy var nameLabel : PosLabel = {
        let label = PosLabel()
        label.text = "초기데이터"
        label.textColor = .appBlack
        label.setFontType(type: .Regular, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var countLabel : PosLabel = {
        let label = PosLabel()
        label.text = "12"
        label.textColor = .appBlack
        label.setFontType(type: .Regular, size: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame : CGRect){
      
        super.init(frame: frame)
        configureLayout()
    }
   
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureLayout(){
        self.backgroundColor = .white
        self.axis = .horizontal
        self.distribution = .equalSpacing
        
        self.addArrangedSubview(nameLabel)
        self.addArrangedSubview(countLabel)
        
//        NSLayoutConstraint.activate([
//            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
//            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
//            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
//            
//            optionLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
//            optionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
//            
//            optionImg.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
//            optionImg.trailingAnchor.constraint(equalTo: optionLabel.leadingAnchor, constant: -10),
//            optionImg.widthAnchor.constraint(equalToConstant: 24),
//            optionImg.heightAnchor.constraint(equalToConstant: 24)
//            
//            
//
//        ])
    }
}
extension MenuSV {
    
    class func getInstance(menuName : String, menuCount : String) -> MenuSV{
        let menuSV = MenuSV()
        menuSV.nameLabel.text = menuName
        menuSV.countLabel.text = menuCount
        
        return menuSV
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MenuSV_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        MenuSV()
            .getPreview()
            .previewLayout(.fixed(width: 1180, height: 64))
        
    }
}
#endif
