//
//  OrderMenuTableViewCell.swift
//  POS
//
//  Created by Jihoon on 11/24/23.
//

import Foundation
import UIKit

class OrderMenuTableViewCell: UITableViewCell {
    
    static let identifier = "OrderMenuTableViewCell"
    
    lazy var menuNameLabel : PosLabel = {
       let label = PosLabel()
        label.textColor = .appBlack
        label.text = "제육볶음"
        label.setFontType(type: .Regular, size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var menuPriceLabel : PosLabel = {
       let label = PosLabel()
        label.textColor = .appBlack
        label.text = Base.shared.seperateComma(text: "10000")
        label.setFontType(type: .Black, size: 16)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var menuCountLabel : PosLabel = {
        let label = PosLabel()
         label.textColor = .appBlack
         label.text = "1"
         label.setFontType(type: .Bold, size: 22)
         label.textAlignment = .center
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
     }()
    
    lazy var checkBoxBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.setCheckBoxImage()
        btn.isSelected = false
        btn.frame.size = CGSize(width: 24, height: 24)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var minusBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .green
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var plusBtn : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = .blue
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var countSV : UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.spacing = 16
        view.addArrangedSubview(minusBtn)
        view.addArrangedSubview(menuCountLabel)
        view.addArrangedSubview(plusBtn)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
        
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        configure()
    }
    
}
extension OrderMenuTableViewCell {
    func configure(){
        addSubview(checkBoxBtn)
        addSubview(countSV)
        addSubview(menuNameLabel)
        
        
        NSLayoutConstraint.activate([
           
            //메뉴 배경 뷰
            checkBoxBtn.topAnchor.constraint(equalTo: topAnchor),
            checkBoxBtn.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkBoxBtn.bottomAnchor.constraint(equalTo: bottomAnchor),
            checkBoxBtn.heightAnchor.constraint(equalToConstant: 24),
            checkBoxBtn.widthAnchor.constraint(equalToConstant: 24),
            
            menuNameLabel.leadingAnchor.constraint(equalTo: checkBoxBtn.trailingAnchor,constant: 8),
            menuNameLabel.centerYAnchor.constraint(equalTo: checkBoxBtn.centerYAnchor),
            
            countSV.trailingAnchor.constraint(equalTo: trailingAnchor),
            countSV.centerYAnchor.constraint(equalTo: checkBoxBtn.centerYAnchor),
            countSV.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            
            
        ])
    }
}


#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct OrderMenuTableViewCell_PreView: PreviewProvider {
    static var previews: some View {
        
        OrderMenuTableViewCell(style: .default, reuseIdentifier: "OrderMenuTableViewCell")
            .getPreview()
            .previewLayout(.fixed(width: 375, height: 24))
    }
}
#endif
