//
//  TopOrderView.swift
//  POS
//
//  Created by Jihoon on 2023/11/25.
//

import Foundation
import SwiftUI
import UIKit

class TopOrderView : UIView {
    //MARK: - Object
    lazy var orderListImg : UIImageView = {
        let view = UIImageView()
        view.image = UIImage.orderListImg
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    // 주문내역 / 1번 테이블
    lazy var titlelabel : PosLabel = {
        let label = PosLabel()
        print(#fileID,#function,#line," jh.ahn - <#comment#> ")
//        label.text = "주문내역 / 1번 테이블" // '1' 숫자만 2, 3, 12 이런식으로 바꾸면 됨
        label.textColor = .appBlack
        label.setFontType(type: .Bold, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
   
    // 2023년 11월 16일 오후 11시 43분
    lazy var dateLabel : PosLabel = {
        let label = PosLabel()
        label.text = "(" + Base.shared.getCurrentDateStr() + ")"
        label.textColor = .appLabelGrey
        label.setFontType(type: .Medium, size: 21)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    // 설정 이미지
    lazy var cancelBtn : UIButton = {
        let btn = UIButton()
        btn.setCancelImage()
        btn.contentMode = .scaleToFill
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var bottomLineView : UIView = {
        let view = UIView()
        view.backgroundColor = .appBlack
        view.contentMode = .scaleToFill
        view.heightAnchor.constraint(equalToConstant: 2).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
//    //설정 라벨
//    lazy var optionLabel : PosLabel = {
//        let label = PosLabel()
//        label.text = "설정"
//        label.textColor = .white
//        label.setFontType(type: .Bold, size: 24)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//MARK: - init
    override init(frame : CGRect){
        super.init(frame: frame)
        configureLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
        configureLayout()
        
    }
    
   
    // previewSize
//    override var intrinsicContentSize: CGSize {
//        return CGSize(width: self.frame.width , height: 64)
//    }
    
}

extension TopOrderView {
    //MARK: - Layout
    private func configureLayout(){
        
        addSubview(orderListImg)
        addSubview(titlelabel)
        addSubview(dateLabel)
        addSubview(cancelBtn)
        addSubview(bottomLineView)
        
        NSLayoutConstraint.activate([
            
            orderListImg.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            orderListImg.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            titlelabel.leadingAnchor.constraint(equalTo: orderListImg.trailingAnchor, constant: 14),
            titlelabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            
            dateLabel.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            dateLabel.leadingAnchor.constraint(equalTo: titlelabel.trailingAnchor, constant: 14),
            dateLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -17),
            
            cancelBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            cancelBtn.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            bottomLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            bottomLineView.bottomAnchor.constraint(equalTo: bottomAnchor)
            

        ])
    }
}



#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct TopOrderView_PreView: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        TopOrderView()
            .getPreview()
            .previewLayout(.fixed(width: 1180, height: 64))
        
    }
}
#endif

