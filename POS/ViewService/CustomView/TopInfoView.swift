//
//  TopInfoView.swift
//  POS
//
//  Created by Jihoon on 2023/11/11.
//

import Foundation
import SwiftUI
import UIKit

class TopInfoView : UIView {
    
    // 2023년 11월 16일 오후 11시 43분
    lazy var dateLabel : PosLabel = {
        let label = PosLabel()
        label.text = Base.shared.getCurrentDateStr()
        label.textColor = .white
        label.setFontType(type: .Medium, size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 설정 이미지
    lazy var optionImg : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.optionImg
        imgView.contentMode = .scaleToFill
        imgView.tintColor = .white
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    //설정 라벨
    lazy var optionLabel : PosLabel = {
        let label = PosLabel()
        label.text = "설정"
        label.textColor = .white
        label.setFontType(type: .Bold, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame : CGRect){
        super.init(frame: frame)
        configureHierarchy()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        configureHierarchy()
        
    }
    
    private func configureHierarchy(){
        self.backgroundColor = .appLightGrey
        
        addSubview(dateLabel)
        addSubview(optionLabel)
        addSubview(optionImg)
        
        
        
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            dateLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            
            optionLabel.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            optionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            optionImg.centerYAnchor.constraint(equalTo: dateLabel.centerYAnchor),
            optionImg.trailingAnchor.constraint(equalTo: optionLabel.leadingAnchor, constant: -10),
            optionImg.widthAnchor.constraint(equalToConstant: 24),
            optionImg.heightAnchor.constraint(equalToConstant: 24)
            
            

        ])
    }
    // previewSize
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: self.frame.width , height: 64)
//    }
    
}



#if DEBUG
import SwiftUI



@available(iOS 13, *)
struct TopInfoView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        TopInfoView()
            .getPreview()
            .previewLayout(.fixed(width: 1180, height: 64))
        
    }
}
#endif

