//
//  File.swift
//  POS
//
//  Created by Jihoon on 11/24/23.
//

import Foundation
import UIKit

class PaymentView: UIView {
    //MARK: Object
    lazy var titleImg : UIImageView = {
        let view = UIImageView()
        view.image = UIImage.orderListImg
        view.translatesAutoresizingMaskIntoConstraints = false
       return view
    }()
    
    lazy var titleLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .Medium, size: 21)
        label.text = "주문내역 결제"
        label.textColor = .appBlack
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var bottomLineView : UIView = {
        let view = UIView()
        view.backgroundColor = .appBlack
        view.contentMode = .scaleToFill
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var orderTableView : OrderTableView = {
        let tableView = OrderTableView(frame: .zero,style: .plain)
        tableView.separatorStyle = .none
        tableView.register(OrderMenuTableViewCell.self, forCellReuseIdentifier: OrderMenuTableViewCell.identifier)
        tableView.backgroundColor = .systemPink
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    lazy var totalLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .Medium, size: 21)
        label.text = "총 "
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalPriceLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .Black, size: 21)
        label.text = "10,000" + "원"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalSlashLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .Medium, size: 21)
        label.text = " /"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalCountLabel : PosLabel = {
        let label = PosLabel()
        label.setFontType(type: .Black, size: 21)
        label.text = "8개 주문"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var totalSV : UIStackView = { // menu StackView ( 메뉴이름, 수량 )
       let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fill
        view.addArrangedSubview(totalLabel)
        view.addArrangedSubview(totalPriceLabel)
        view.addArrangedSubview(totalSlashLabel)
        view.addArrangedSubview(totalCountLabel)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var deleteBtn : UIButton = {
       let btn = UIButton()
        btn.layer.cornerRadius = 30
        btn.setDeleteImage()
        btn.addTarget(self, action: #selector(clickDelete), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    lazy var orderBtn : UIButton = {
       let btn = UIButton()
        btn.layer.cornerRadius = 30
        btn.backgroundColor = .orderBtnBg
        btn.setTitle("주문하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setFontType(type: .Medium, size: 20)
        btn.addTarget(self, action: #selector(clickOrder), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    lazy var paymentBtn : UIButton = {
       let btn = UIButton()
        btn.layer.cornerRadius = 30
        btn.backgroundColor = .appBlue
        btn.setTitle("결제하기", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.setFontType(type: .Medium, size: 20)
        btn.addTarget(self, action: #selector(clickPayment), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    
    
    var paymentBlock : (() -> Void)? = nil
    var orderBlock : (() -> Void)? = nil
    var deleteBlock : (() -> Void)? = nil
    
    
    //MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//MARK: Action
extension PaymentView {
    @objc private func clickPayment(){
        paymentBlock?()
    }
    @objc private func clickOrder(){
        orderBlock?()
    }
    @objc private func clickDelete(){
        deleteBlock?()
    }
}
//MARK: Layout
extension PaymentView {
    private func configure(){
        addSubview(titleImg)
        addSubview(titleLabel)
        addSubview(bottomLineView)
        addSubview(orderTableView)
        addSubview(totalSV)
        addSubview(deleteBtn)
        addSubview(orderBtn)
        addSubview(paymentBtn)
        
        NSLayoutConstraint.activate([
            
            titleImg.trailingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: -8),
            titleImg.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 24),
            
            bottomLineView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            bottomLineView.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLineView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            orderTableView.topAnchor.constraint(equalTo: bottomLineView.bottomAnchor, constant: 24),
            orderTableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            orderTableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            orderTableView.bottomAnchor.constraint(equalTo: deleteBtn.topAnchor, constant: -5),
            
            paymentBtn.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20),
            paymentBtn.widthAnchor.constraint(equalToConstant: 320),
            paymentBtn.heightAnchor.constraint(equalToConstant: 60),
            paymentBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            orderBtn.bottomAnchor.constraint(equalTo: paymentBtn.topAnchor, constant: -20),
            orderBtn.widthAnchor.constraint(equalToConstant: 320),
            orderBtn.heightAnchor.constraint(equalToConstant: 60),
            orderBtn.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            deleteBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8),
            deleteBtn.bottomAnchor.constraint(equalTo: totalSV.topAnchor, constant : -20),
            
            totalSV.centerXAnchor.constraint(equalTo: centerXAnchor),
            totalSV.bottomAnchor.constraint(equalTo: orderBtn.topAnchor, constant: -25)
            

        ])
        
    }
}
import SwiftUI

@available(iOS 13, *)
struct PaymentView_PreView: PreviewProvider {
    static var previews: some View {
        
        PaymentView()
            .getPreview()
            .previewLayout(.fixed(width: 375, height:756))
    }
}
