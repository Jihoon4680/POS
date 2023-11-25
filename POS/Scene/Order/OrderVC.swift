//
//  File.swift
//  POS
//
//  Created by Jihoon on 11/24/23.
//

import Foundation
import UIKit

class OrderVC : UIViewController {
    
    let vm = OrderVM()
    
    lazy var topOrderView : TopOrderView = {
        let view = TopOrderView()
        print(#fileID,#function,#line," jh.ahn - <#comment#> ")
        view.titlelabel.text = "주문내역 / \(1)번 테이블"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var paymentView : PaymentView = {
        let view = PaymentView()
        view.backgroundColor = .tableViewBg
        view.translatesAutoresizingMaskIntoConstraints = false
        view.orderTableView.delegate = self
        view.orderTableView.dataSource = self
        return view
    }()
    lazy var menuCV : MenuCollectionView = {
        let cv = MenuCollectionView(frame: .zero, collectionViewLayout: MenuCollectionView.createLayout())
        
        cv.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        cv.register(MenuHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MenuHeaderView.identifier)
        cv.backgroundColor = .white
        cv.delegate = self
        cv.dataSource = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureLayout()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
}
//MARK: - Layout & UI
extension OrderVC {
    
    class func getInstance(tableNum : Int) -> OrderVC {
        let vc = OrderVC()
        vc.vm.tableNum = tableNum
        vc.topOrderView.titlelabel.text = "주문내역 / \(tableNum)번 테이블"
        return vc
    }
    
    private func configureLayout(){
        view.addSubview(topOrderView)
        view.addSubview(menuCV)
        view.addSubview(paymentView)
        
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            //상단 날짜 뷰
            topOrderView.topAnchor.constraint(equalTo: view.topAnchor),
            topOrderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topOrderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topOrderView.heightAnchor.constraint(equalToConstant: 64),
            
            menuCV.topAnchor.constraint(equalTo: topOrderView.bottomAnchor),
            menuCV.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuCV.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuCV.trailingAnchor.constraint(equalTo: paymentView.leadingAnchor),
            
            paymentView.topAnchor.constraint(equalTo: topOrderView.bottomAnchor),
            paymentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            paymentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            paymentView.widthAnchor.constraint(equalToConstant: 375)
            
            
            ])
        
    }
}

extension OrderVC : UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return vm.numberOfSections(in: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return vm.collectionView(collectionView, cellForItemAt: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return vm.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
}
extension OrderVC : UICollectionViewDelegate{
    
}

extension OrderVC : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}
extension OrderVC : UITableViewDelegate{
    
}
