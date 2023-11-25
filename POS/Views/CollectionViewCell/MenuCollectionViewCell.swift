//
//  MenuCollectionViewCell.swift
//  POS
//
//  Created by Jihoon on 11/24/23.
//

import Foundation


import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuCollectionViewCell"
    
    lazy var nameLabel : PosLabel = {
       let label = PosLabel()
        label.textColor = .appBlack
        label.text = "제육볶음"
        label.numberOfLines = 0
        label.setFontType(type: .Regular, size: 22)
//        label.setTextWithLineHeight(text: "10", lineHeight: 30)
        label.clipsToBounds = true
//        label.layer.cornerRadius = 16
//        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var priceLabel : PosLabel = {
       let label = PosLabel()
        label.textColor = .appBlack
        label.text = Base.shared.seperateComma(text: "10000") + "원"
        label.setFontType(type: .Black, size: 22)
        label.clipsToBounds = true
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var menuSV : UIStackView = { // menu StackView ( 메뉴이름, 수량 )
       let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 10
        view.addArrangedSubview(nameLabel)
        view.addArrangedSubview(priceLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var containerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var cancelBtn : UIButton = {
        let btn = UIButton()
        btn.isHidden = true
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.backgroundColor = .yellow
        return btn
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#fileID,#function,#line," jh.ahn - <#comment#> ")
        configureUI()
        configureLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
}

extension MenuCollectionViewCell {
    
    private func configureUI(){
        backgroundColor = .white
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.tableBorder.cgColor
        containerView.layer.cornerRadius = 16
        
//        threeDotImgView.isHidden = false
    }
    
    private func configureLayout(){
        print(#fileID,#function,#line," jh.ahn -  ")

        addSubview(containerView)
        containerView.addSubview(menuSV)
        addSubview(cancelBtn)
  
        NSLayoutConstraint.activate([
            
            //메뉴 배경 뷰
            containerView.topAnchor.constraint(equalTo: topAnchor,constant: 6),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            //메뉴 스택뷰
            menuSV.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            menuSV.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            menuSV.leadingAnchor.constraint(equalTo: containerView.leadingAnchor,constant: 15),
            
            cancelBtn.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            cancelBtn.centerYAnchor.constraint(equalTo: containerView.topAnchor),
            cancelBtn.widthAnchor.constraint(equalToConstant: 12),
            cancelBtn.heightAnchor.constraint(equalToConstant: 12),
            
          
        ])
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MenuCollectionViewCell_PreView: PreviewProvider {
    static var previews: some View {
        
        MenuCollectionViewCell()
            .getPreview()
            .previewLayout(.fixed(width: 250, height: 250))
    }
}
#endif

