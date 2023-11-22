//
//  PopupVC.swift
//  POS
//
//  Created by Jihoon on 11/22/23.
//

import Foundation
import UIKit

class PopupVC : UIViewController{
    
    lazy var dimView : UIView = {
        let view = UIView()
        view.backgroundColor = .black.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var contentView : UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .ExtraBold, size: 30)
        label.textColor = .appBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var bodyLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .Regular, size: 16)
        label.textColor = .appBlack
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cencelBtn : UIButton = {
       let btn = UIButton()
        btn.layer.cornerRadius = btn.frame.height/2
        btn.backgroundColor = .appGrey
        btn.setTitle("취소", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(clickCancel), for: .touchUpInside)
        return btn
    }()
    
    lazy var okBtn : UIButton = {
       let btn = UIButton()
        btn.layer.cornerRadius = btn.frame.height/2
        btn.backgroundColor = .appGrey
        btn.setTitle("확인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(clickOk), for: .touchUpInside)
        return btn
    }()
    
    let cancelBlock : (() -> Void)? = nil
    let okBlock : (() -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .yellow
        configureUI()
        configureLayout()
    }
    
    private func configureLayout(){
        
        view.addSubview(dimView)
        view.addSubview(contentView)
        view.addSubview(titleLabel)
        view.addSubview(bodyLabel)
        
        NSLayoutConstraint.activate([
            
            dimView.topAnchor.constraint(equalTo: self.view.topAnchor),
            dimView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            dimView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            dimView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            contentView.topAnchor.constraint(equalTo: titleLabel.topAnchor,constant: -20),
            contentView.bottomAnchor.constraint(equalTo: bodyLabel.bottomAnchor,constant: 20),
            
            //상단 날짜 뷰
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
        ])
        print(#fileID, #function, #line, " jh.ahn  - view : \(self.view.frame) dim \(dimView.frame)")
    }
    
    private func configureUI(){
        
    }
    
    @objc private func clickCancel(){
        cancelBlock?()
    }
    
    @objc private func clickOk(){
        okBlock?()
    }
}
