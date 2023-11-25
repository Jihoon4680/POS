//
//  TableCountPopup.swift
//  POS
//
//  Created by Jihoon on 2023/11/26.
//

import Foundation
import UIKit



class TableCountPopup : UIViewController{
    
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
        label.text = "테이블 개수 설정"
        label.textColor = .appBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var tableCountLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .SemiBold, size: 16)
        label.text = "설정 테이블 개수 :"
        label.textColor = .appBlack
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var tableCountTextField : UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray5
        textField.textColor = .appBlack
        textField.font = UIFont.notoSansKR(size: 16, family: .Medium)
        textField.textAlignment = .center
        textField.placeholder = "개수를 입력하세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
        
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
        configureLayout()
    }
    
    //    override func viewWillAppear(_ animated: Bool) {
    //        super.viewWillAppear(animated)
    //        configureOneButtonLayout()
    //    }
 
    //MARK: 취소/확인 버튼 Popup
    private func configureLayout(){
        let safeAreaGuide = view.safeAreaLayoutGuide
        contentView.addSubview(titleLabel)
        contentView.addSubview(tableCountLabel)
        contentView.addSubview(tableCountTextField)
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
            contentView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 50),
            titleLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            tableCountLabel.trailingAnchor.constraint(equalTo: self.view.centerXAnchor, constant: -10),
            tableCountLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            tableCountTextField.leadingAnchor.constraint(equalTo: view.centerXAnchor,constant: 10),
            tableCountTextField.widthAnchor.constraint(equalTo: tableCountLabel.widthAnchor, multiplier: 1.3),
            tableCountTextField.centerYAnchor.constraint(equalTo: tableCountLabel.centerYAnchor),
            
            
            twoBtnSV.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
            twoBtnSV.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            twoBtnSV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 30),
            twoBtnSV.heightAnchor.constraint(equalToConstant: 44)
            
        ])
        
    }
    
    //MARK: 테이블 개수 세팅 팝업
    
    
//    func configureUI(title : String, body : String){
//        titleLabel.text = title
//        tableCountLabel.text = body
//    }
    
    @objc private func clickCancel(){
        //        cancelBlock?()
        SceneManager.shared.nav?.dismiss(animated: false)
    }
    
    @objc private func clickOk(){
        if let tableCount = tableCountTextField.text {
            let intTableCount = Int(tableCount) ?? 0
            Base.shared.setTableCount(tableCount: intTableCount )
        }else {
            ToastManager.showMessage("테이블 개수를 입력하세요.")
        }
        
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct TableCountPopupManger_PreView: PreviewProvider {
    static var previews: some View {
        
        TableCountPopup()
            .getPreview()
            .previewLayout(.fixed(width: 1100, height: 795))
    }
}
#endif
