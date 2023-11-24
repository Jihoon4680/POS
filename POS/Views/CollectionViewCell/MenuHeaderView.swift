//
//  MenuHeaderView.swift
//  POS
//
//  Created by Jihoon on 11/24/23.
//

import UIKit

class MenuHeaderView: UICollectionReusableView {
    static let identifier = "MenuHeaderView"
    
    
    lazy var titleLabel: PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .Medium, size: 24)
        label.text = "요리"
        label.textAlignment = .left
        label.textColor = .appBlack
        label.sizeToFit()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure() {
        addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            //메뉴 배경 뷰
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
        
    }
    
    
}
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MenuHeaderView_PreView: PreviewProvider {
    static var previews: some View {
        
        MenuHeaderView()
            .getPreview()
            .previewLayout(.fixed(width: 1180 , height: 50))
    }
}
#endif

