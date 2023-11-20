//
//  SplashVC.swift
//  POS
//
//  Created by Jihoon on 2023/10/30.
//
import Foundation
import UIKit
import Combine

class SplashVC: UIViewController {
    
    let splashView : SplashView = {
        let view = SplashView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        SceneManager.shared.nav = self.navigationController // navigation 설정
        configureHierarchy()
//        UIFont.checkFontName() // 기기 내 Font Name 확인 
        
    }
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5 , execute: { [weak self] in
            self?.goToMain()
        })
    }
    
    func configureHierarchy(){
        let safeAreaGuide = view.safeAreaLayoutGuide
    
        view.addSubview(splashView)
        
        NSLayoutConstraint.activate([

            splashView.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor),
            splashView.leadingAnchor.constraint(equalTo: safeAreaGuide.leadingAnchor),
            splashView.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor),
            splashView.trailingAnchor.constraint(equalTo: safeAreaGuide.trailingAnchor)
            
        ])
    }
    
    func goToMain(){
        let main = MainVC()
        SceneManager.shared.pushVC(vc: main)
    }
    
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct SplashVC_PreView: PreviewProvider {
    static var previews: some View {
        
        SplashVC()
            .getPreview()
    }
}
#endif
