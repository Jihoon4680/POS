//
//  orderOptionCollectionViewCell.swift
//  POS
//
//  Created by Jihoon on 2023/11/18.
//

import UIKit

class OrderOptionCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OrderOptionCollectionViewCell"
    
    lazy var titleLabel : PosLabel = {
        let label = PosLabel()
        label.text = "테이블번호"
        label.textColor = .black
        label.setFontType(type: .Bold, size: 25)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
}

extension OrderOptionCollectionViewCell {
    func configure(){
        print(#fileID,#function,#line," jh.ahn - <#comment#> ")
        self.backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.tableBorder.cgColor
        layer.cornerRadius = 8
        
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            //상단 날짜 뷰
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct OrderOptionCollectionViewCell_PreView: PreviewProvider {
    static var previews: some View {
        
        OrderOptionCollectionViewCell()
            .getPreview()
            .previewLayout(.fixed(width: 154, height: 42))
    }
}
#endif
