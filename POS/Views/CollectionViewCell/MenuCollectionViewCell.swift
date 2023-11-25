//
//  MenuCollectionViewCell.swift
//  POS
//
//  Created by seobe22 on 11/22/23.
//

import UIKit

struct MenuModel {
    var menuName: String
    var price: Int
    var isDrink: Bool
}

class MenuCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "MenuCollectionViewCell"
    
    lazy var menuNameLabel: PosLabel = {
        let label = PosLabel()
        label.textColor = .black
        label.setFontType(type: .Medium, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var menuPriceLabel: PosLabel = {
        let label = PosLabel()
        label.textColor = .black
        label.setFontType(type: .Black, size: 22)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var vStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 10
        stack.distribution = .fill
        stack.alignment = .center
        stack.addArrangedSubview(menuNameLabel)
        stack.addArrangedSubview(menuPriceLabel)
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
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
        backgroundColor = UIColor.menuFoodViewBg
        layer.cornerRadius = 16
    }
    
    private func configureLayout() {
        addSubview(vStack)
        
        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: centerYAnchor),
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
