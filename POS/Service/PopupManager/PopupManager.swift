//
//  PopupVC.swift
//  POS
//
//  Created by Jihoon on 11/22/23.
//

import Foundation
import UIKit

enum PopupType {
    case OneButton
    case TwoButton
    case TableSetting
    case CategorySetting
}

class PopupManager : UIViewController{
    
    var type : PopupType = .OneButton
    
    lazy var dimView : UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .black.withAlphaComponent(0.5)
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
        label.text = "팝업 제목"
        label.textColor = .appBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var bodyLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .Regular, size: 16)
        label.text = "팝업내용 입력"
        label.textColor = .appBlack
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var cancelBtn : UIButton = {
       let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.backgroundColor = .appGrey
        btn.setTitle("취소", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setFontType(type: .Bold, size: 20)
        btn.addTarget(self, action: #selector(clickCancel), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var okBtn : UIButton = {
       let btn = UIButton()
        btn.layer.cornerRadius = 20
        btn.backgroundColor = .appBlue
        btn.setTitle("확인", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setFontType(type: .Bold, size: 20)
        btn.addTarget(self, action: #selector(clickOk), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var twoBtnSV : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [cancelBtn,okBtn])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    var cancelBlock : (() -> Void)? = nil
    var okBlock : (() -> Void)? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if type == .OneButton {
            configureOneButtonLayout()
        }else {
            configureTwoButtonLayout()
        }
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        configureOneButtonLayout()
//    }
    //MARK: 확인
    private func configureOneButtonLayout(){
        let safeAreaGuide = view.safeAreaLayoutGuide
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(okBtn)
        dimView.addSubview(contentView)
        view.addSubview(dimView)
 
       
        
        NSLayoutConstraint.activate([
            
            dimView.topAnchor.constraint(equalTo: self.view.topAnchor),
            dimView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            dimView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            dimView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 300),
            contentView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: okBtn.bottomAnchor,constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bodyLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 150),
            bodyLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 500),
            
            okBtn.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 20),
            okBtn.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            okBtn.widthAnchor.constraint(equalToConstant: 150),
            okBtn.heightAnchor.constraint(equalToConstant: 40)
            
            
        ])
        print(#fileID, #function, #line, " jh.ahn  - view : \(self.view.frame) dim \(dimView.frame)")
    }
    //MARK: 취소/확인 버튼 Popup
    private func configureTwoButtonLayout(){
        let safeAreaGuide = view.safeAreaLayoutGuide
        contentView.addSubview(titleLabel)
        contentView.addSubview(bodyLabel)
        contentView.addSubview(twoBtnSV)
        dimView.addSubview(contentView)
        view.addSubview(dimView)
 
        
        
        NSLayoutConstraint.activate([
            
            dimView.topAnchor.constraint(equalTo: self.view.topAnchor),
            dimView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            dimView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            dimView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            
            contentView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            contentView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
            contentView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 300),
            contentView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: twoBtnSV.bottomAnchor,constant: 20),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
            bodyLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            bodyLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            bodyLabel.heightAnchor.constraint(lessThanOrEqualToConstant: 500),
            
            twoBtnSV.topAnchor.constraint(equalTo: bodyLabel.bottomAnchor, constant: 20),
            twoBtnSV.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            twoBtnSV.leadingAnchor.constraint(equalTo: bodyLabel.leadingAnchor),
            twoBtnSV.heightAnchor.constraint(equalToConstant: 44)
             
        ])
     
    }
    
    //MARK: 테이블 개수 세팅 팝업
    
    
    func configureUI(title : String, body : String){
        titleLabel.text = title
        bodyLabel.text = body
    }
    
    @objc private func clickCancel(){
//        cancelBlock?()
        SceneManager.shared.nav?.dismiss(animated: false)
    }
    
    @objc private func clickOk(){
        okBlock?()
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct TableCountPopup_PreView: PreviewProvider {
    static var previews: some View {
        
        TableCountPopup()
            .getPreview()
    }
}
#endif
