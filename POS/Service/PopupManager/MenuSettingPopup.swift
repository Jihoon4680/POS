//
//  MenuSettingPopup.swift
//  POS
//
//  Created by Jihoon on 2023/11/26.
//


import Foundation
import UIKit



class MenuSettingPopup : UIViewController{
    
    let menuCategoryStr = ["요리","주류"]
    let menuCategoryNum = [0,1]
    
    
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
        label.text = "메뉴 추가"
        label.textColor = .appBlack
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var categoryLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .SemiBold, size: 16)
        label.text = "메뉴 종류 : "
        label.textColor = .appBlack
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var categoryPickerView :UIPickerView = {
        let view = UIPickerView()
        view.delegate = self
        view.dataSource = self
        return view
    }()
    lazy var categorySV : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [categoryLabel,categoryPickerView])
        sv.axis = .horizontal
        sv.heightAnchor.constraint(equalToConstant: 15).isActive = true
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    lazy var menuNameLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .SemiBold, size: 16)
        label.text = "메뉴 가격 : "
        label.textColor = .appBlack
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var menuNameTextField : UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray5
        textField.textColor = .appBlack
        textField.font = UIFont.notoSansKR(size: 16, family: .Medium)
        textField.textAlignment = .center
        textField.placeholder = "가격을 입력하세요"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var menuNameSV : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [menuNameLabel,menuNameTextField])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var priceLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .SemiBold, size: 16)
        label.text = "가격 : "
        label.textColor = .appBlack
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var priceTextField : UITextField = {
        let textField = UITextField()
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .systemGray5
        textField.textColor = .appBlack
        textField.font = UIFont.notoSansKR(size: 16, family: .Medium)
        textField.textAlignment = .center
        textField.placeholder = "10,000원"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var priceSV : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [priceLabel,priceTextField])
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 20
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    lazy var allSV : UIStackView = {
        let sv = UIStackView(arrangedSubviews: [categorySV,menuNameSV,priceSV])
        sv.axis = .vertical
        sv.distribution = .fillEqually
        sv.spacing = 10
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
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
        contentView.addSubview(allSV)
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
            

            allSV.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            allSV.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            allSV.heightAnchor.constraint(equalToConstant: 200),
            allSV.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: -20),

            
            twoBtnSV.topAnchor.constraint(equalTo: allSV.bottomAnchor, constant: 20),
            twoBtnSV.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            twoBtnSV.leadingAnchor.constraint(equalTo: allSV.leadingAnchor),
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
//        if let tableCount = tableCountTextField.text {
//            let intTableCount = Int(tableCount) ?? 0
//            Base.shared.setTableCount(tableCount: intTableCount )
//        }else {
//            ToastManager.showMessage("테이블 개수를 입력하세요.")
//        }
        
    }
    
}

extension MenuSettingPopup : UIPickerViewDelegate,UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // pickerView에 표현하고 싶은 아이템의 갯수
        // 각각의 component 마다 다른 값을 갖게 한다.
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return menuCategoryStr.count
            
        }
        
        // pickerView에서 특정 아이템을 선택했을 때의 행위
        // 각각의 component 마다 다른 값을 갖게 한다.
        func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
//                label.text = menuCategoryStr[row]
        }
        
        // pickerView에서 보여주고 싶은 아이템의 제목
        // 각각의 component 마다 다른 값을 갖게 한다.
        func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
                return menuCategoryStr[row]
        }
        
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MenuSettingPopup_PreView: PreviewProvider {
    static var previews: some View {
        
        MenuSettingPopup()
            .getPreview()
            .previewLayout(.fixed(width: 1100, height: 795))
    }
}
#endif
