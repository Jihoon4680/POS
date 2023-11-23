//
//  MenuCollectionViewCell.swift
//  POS
//
//  Created by seobe22 on 11/22/23.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuCollectionViewCell"
    
    lazy var menuNameLabel: PosLabel = {
        let label = PosLabel()
        label.textColor = .black
        label.text = "제육볶음"
        label.setFontType(type: .Regular, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var menuPriceLabel: PosLabel = {
        let label = PosLabel()
        label.textColor = .black
        label.text = "10,000원"
        label.setFontType(type: .Black, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
}

extension MenuCollectionViewCell {
    private func configureUI() {
        backgroundColor = UIColor.menuViewBg
        layer.cornerRadius = 16
    }
    
    private func configureLayout() {
        addSubview(menuNameLabel)
        addSubview(menuPriceLabel)
        
        NSLayoutConstraint.activate([
            menuNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 28),
            menuNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 45),
            menuNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -45),
            
            menuPriceLabel.topAnchor.constraint(equalTo: menuNameLabel.bottomAnchor, constant: 10),
            menuPriceLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 38),
            menuPriceLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 38),
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
            .previewLayout(.fixed(width: 168, height: 136))
    }
}
#endif
