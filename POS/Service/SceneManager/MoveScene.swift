//
//  CorrdinatorProtocol.swift
//  POS
//
//  Created by Jihoon on 2023/11/04.
//

import Foundation
import UIKit

protocol MoveScene {
    func showPopup(type : PopupType,title : String, body : String, okAction : @escaping (()->Void)) // 팝업을 어떻게 띄울 것 인가.
    func pushVC(vc : UIViewController?) // nav view Push
    func popVC() // nav view Pop
}
