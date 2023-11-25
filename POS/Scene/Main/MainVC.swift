
//
//  SplashVC.swift
//  POS
//
//  Created by Jihoon on 2023/10/30.
//

import UIKit
import Combine

class MainVC: UIViewController {
    
    let vm = MainVM()
    
    // 시간 뷰
    lazy var topInfoView : TopInfoView = {
        let view = TopInfoView() // 상단 날짜, 시간 뷰
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    // OrderOption & TableList  CollectionView
    lazy var mainCollectionView : TableUICollectionView = {
        let collectionView = TableUICollectionView(frame: .zero, collectionViewLayout: TableUICollectionView.createLayout())
        collectionView.register(TableCollectionViewCell.self, forCellWithReuseIdentifier: TableCollectionViewCell.identifier) // 셀 등록
        collectionView.register(OrderOptionCollectionViewCell.self, forCellWithReuseIdentifier: OrderOptionCollectionViewCell.identifier)

        collectionView.translatesAutoresizingMaskIntoConstraints = false 
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureLayout()
        configureDataSource()
        Base.shared.checkSales() // 영업시작 전 or 시작 24시간이후
        
        
    }
    // 시간,와이파이,배터리잔량 상태 바 Hidden
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func configureLayout(){
        // safeArea잡기
        let safeAreaGuide = view.safeAreaLayoutGuide
        view.addSubview(topInfoView)
        view.addSubview(mainCollectionView)
        
        NSLayoutConstraint.activate([
            //상단 날짜 뷰
            topInfoView.topAnchor.constraint(equalTo: view.topAnchor),
            topInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topInfoView.heightAnchor.constraint(equalToConstant: 64),
            // 테이블번호, 주문내역, 설정
            // 테이블 콜렉션뷰
            mainCollectionView.topAnchor.constraint(equalTo: topInfoView.bottomAnchor),
            mainCollectionView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            mainCollectionView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            mainCollectionView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor),
            
        ])
//        print(#fileID,#function,#line," jh.ahn - collectionView Frame : \(mainCollectionView.frame) ")
    }
    func configureDataSource() {
        mainCollectionView.delegate = self
        mainCollectionView.dataSource = self
 
    }
    
}

extension MainVC : UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        print(#fileID,#function,#line," jh.ahn - section \( section.hashValue) ")
        if section == 0 {
            return 3
        } else {
            return 30
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        print("section index : \(indexPath.section)")
        return vm.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    
    
}
extension MainVC : UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        vm.collectionView(collectionView, didSelectItemAt: indexPath)
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct MainVC_PreView: PreviewProvider {
    static var previews: some View {
        
        MainVC()
            .getPreview()
    }
}
#endif
