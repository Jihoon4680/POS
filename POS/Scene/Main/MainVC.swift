
//
//  SplashVC.swift
//  POS
//
//  Created by Jihoon on 2023/10/30.
//

import UIKit
import Combine

class MainVC: UIViewController {
    
    let mainView : MainCollectionView = {
        let view = MainCollectionView()
        view.translatesAutoresizingMaskIntoConstraints = false // 이거 왜 안됐는데
        return view
    }()
    let topInfoView : TopInfoView = {
        let view = TopInfoView() // 상단 날짜, 시간 뷰
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
    }
    // 시간,와이파이,배터리잔량 상태 바 Hidden 
    override var prefersStatusBarHidden: Bool {
            return true
    }
    
    func configureHierarchy(){
        // safeArea잡기 
        let safeAreaGuide = view.safeAreaLayoutGuide
        view.addSubview(topInfoView)
        view.addSubview(mainView)

        NSLayoutConstraint.activate([
            //상단 날짜 뷰
            topInfoView.topAnchor.constraint(equalTo: view.topAnchor),
            topInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topInfoView.heightAnchor.constraint(equalToConstant: 64),
            // 테이블번호, 주문내역, 설정
            // 테이블 콜렉션뷰
            mainView.topAnchor.constraint(equalTo: topInfoView.bottomAnchor),
            mainView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            mainView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            mainView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor)
        ])
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
