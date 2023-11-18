//
//  SplashView.swift
//  POS
//
//  Created by Jihoon on 2023/10/30.
////

import Foundation
import UIKit
import SwiftUI

class SplashView : UIView {
    
    
    lazy var titleLabel : PosLabel = {
        let label = PosLabel()
        label.text = "POS"
        label.textColor = .btnBlue
        label.setFontType(type: .ExtraBold, size: 30)
        return label
    }()

    override init(frame : CGRect){
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        configure()
        
    }
    
    private func configure(){
        addSubview(titleLabel)
        titleLabel.sizeToFit()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct SplashView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        SplashView()
            .getPreview()
            .previewLayout(.sizeThatFits)
            .ignoresSafeArea()
    }
}
#endif

