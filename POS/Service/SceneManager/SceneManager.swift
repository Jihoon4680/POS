//
//  ViewManager.swift
//  POS
//
//  Created by Jihoon on 2023/11/04.
//

import Foundation
import UIKit

//MARK: 싱글톤 View관련 인스턴스 및 화면 이동

class SceneManager : NSObject {
    
    private override init() {}
    
    static let shared  = SceneManager()
    
    var nav : UINavigationController? // RootViewController Navigation
    
    // MARK: VC 모음 ( 현재 사용하는 VC 인스턴스 주소를 담고 있는다. )
    
    var splashVC : SplashVC? // Intro 토큰검사 및 회원 검사
    
    var mainVC : MainVC? // 테이블 & 주문목록
    
}

// MARK: Scene move 관련
extension SceneManager : MoveScene {
    func pushVC(vc: UIViewController?) {
        if let vc = vc {
            nav?.pushViewController(vc, animated: true)
        }
    }
    
    func popVC() {
            nav?.popViewController(animated: true)
    }
}
