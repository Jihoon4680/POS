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
    
    var popupVC : PopupManager?
    
}

// MARK: Scene move 관련
extension SceneManager : MoveScene {
    func showAddMenuPopup() {
        let vc = MenuSettingPopup()
        vc.modalPresentationStyle = .overFullScreen
        nav?.present(vc, animated: false)
    }
    
    
    func showTableCountPopup() {
        let vc = TableCountPopup()
        nav?.present(vc, animated: false)
    }
    
    /*
     // MARK: - ShowPopup
     Popup띄우기 확인과 취소 액션을 커스텀
     @ date 2023.11.23
     @ author jhahn
     @ param type : 버튼 개수
                okAction : let action = { // 동작코드 ex.print("ok" //} 선언 후 입력
                okAction : let action = { // 동작코드 ex.print("cancel" //} 선언 후 입력
     @ return
     */
    func showPopup(type: PopupType,title : String, body : String, okAction: @escaping (() -> Void)) {
        let popupVC = PopupManager()
        popupVC.modalPresentationStyle = .overFullScreen
        popupVC.type = type
        popupVC.configureUI(title: title, body: body)
        popupVC.okBlock = okAction
//        popupVC.cancelBlock = cancelAction
        nav?.present(popupVC, animated: false)
    }
    
    func pushVC(vc: UIViewController?) {
        if let vc = vc {
            nav?.pushViewController(vc, animated: true)
        }
    }
    
    func popVC() {
            nav?.popViewController(animated: true)
    }
}
