//
//  TableCollectionViewCell.swift
//  POS
//
//  Created by Jihoon on 2023/11/17.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TableCollectionViewCell"
    
    lazy var tableNumLabel : PosLabel = {
       let label = PosLabel()
        label.textColor = .white
        label.text = "10"
        label.backgroundColor = .appGrey
        
        label.setFontType(type: .Black, size: 21)
        label.setTextWithLineHeight(text: "10", lineHeight: 30)
        label.clipsToBounds = true
        label.layer.cornerRadius = 16
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMaxYCorner]
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    lazy var menuSV : UIStackView = { // menu StackView ( 메뉴이름, 수량 )
//       let view = UIStackView()
//        view.axis = .horizontal
//        view.distribution = .fillProportionally
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
    
    lazy var menuListSV : UIStackView = { // menuList StackView
       let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillEqually
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .blue
        return view
    }()
    // ... 이미지 ( 메뉴가 많을 때 )
    lazy var threeDotImgView : UIImageView = {
       let imgView = UIImageView()
        let img = UIImage(named: "threeDot_icon") ?? UIImage()
        imgView.image = img
        imgView.isHidden = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//        print(#fileID,#function,#line," jh.ahn - <#comment#> ")
        configureUI()
        configureLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
}

extension TableCollectionViewCell {
    
    private func configureUI(){
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.tableBorder.cgColor
        layer.cornerRadius = 16
        
//        threeDotImgView.isHidden = false
    }
    
    private func configureLayout(){
//        print(#fileID,#function,#line," jh.ahn - <#comment#> ")

        addSubview(tableNumLabel)
        addSubview(menuListSV)
        addSubview(threeDotImgView)
  
        NSLayoutConstraint.activate([
            //상단 날짜 뷰
            tableNumLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableNumLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableNumLabel.widthAnchor.constraint(equalToConstant: 54),
            tableNumLabel.heightAnchor.constraint(equalToConstant: 34),
            
            menuListSV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            menuListSV.topAnchor.constraint(equalTo: tableNumLabel.bottomAnchor, constant: 6),
            menuListSV.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,constant: -16 ),
            menuListSV.bottomAnchor.constraint(equalTo:threeDotImgView.topAnchor,constant: -12 ),
            
            // ... 이미지뷰
            threeDotImgView.centerXAnchor.constraint(equalTo: centerXAnchor),
            threeDotImgView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            threeDotImgView.widthAnchor.constraint(equalToConstant: 16),
            threeDotImgView.heightAnchor.constraint(equalToConstant: 4)
        ])
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct TableCollectionViewCell_PreView: PreviewProvider {
    static var previews: some View {
        
        TableCollectionViewCell()
            .getPreview()
            .previewLayout(.fixed(width: 250, height: 200))
    }
}
#endif

