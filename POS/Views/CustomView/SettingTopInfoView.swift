//
//  SettingTopInfoView.swift
//  POS
//
//  Created by seobe22 on 11/22/23.
//

import UIKit

class SettingTopInfoView: UIView {
    
    lazy var optionImg : UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.optionImg
        imgView.contentMode = .scaleToFill
        imgView.tintColor = .black
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    lazy var optionLabel : PosLabel = {
        let label = PosLabel()
        label.text = "설정"
        label.textColor = .black
        label.setFontType(type: .Bold, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var closeImg: UIImageView = {
        let imgView = UIImageView()
        imgView.image = UIImage.closeImg
        imgView.contentMode = .scaleToFill
        imgView.tintColor = .black
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
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
        self.backgroundColor = .white
        
        addSubview(optionImg)
        addSubview(optionLabel)
        addSubview(closeImg)
        
        NSLayoutConstraint.activate([
            optionImg.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            optionImg.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 31),
            optionImg.widthAnchor.constraint(equalToConstant: 24),
            optionImg.heightAnchor.constraint(equalToConstant: 24),
            
            optionLabel.leadingAnchor.constraint(equalTo: optionImg.trailingAnchor, constant: 10),
            optionLabel.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            
            closeImg.widthAnchor.constraint(equalToConstant: 24),
            closeImg.heightAnchor.constraint(equalToConstant: 24),
            closeImg.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            closeImg.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24)
        ])
    }
    
}

#if DEBUG
import SwiftUI



@available(iOS 13, *)
struct SettingTopInfoView_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        SettingTopInfoView()
            .getPreview()
        
    }
}
#endif
