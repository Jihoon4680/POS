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

    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#fileID,#function,#line," jh.ahn - <#comment#> ")
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
}

extension TableCollectionViewCell {
    func configure(){
        print(#fileID,#function,#line," jh.ahn - <#comment#> ")
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.tableBorder.cgColor
        layer.cornerRadius = 16
        

        
        addSubview(tableNumLabel)
        
        
        NSLayoutConstraint.activate([
            //상단 날짜 뷰
            tableNumLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tableNumLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            tableNumLabel.widthAnchor.constraint(equalToConstant: 54),
            tableNumLabel.heightAnchor.constraint(equalToConstant: 34)
            
            
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
            .previewLayout(.fixed(width: 168, height: 136))
    }
}
#endif

