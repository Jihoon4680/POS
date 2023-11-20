//
//  CorrdinatorProtocol.swift
//  POS
//
//  Created by Jihoon on 2023/11/04.
//

import Foundation
import UIKit

protocol MoveScene {
    func pushVC(vc : UIViewController?) // nav view Push
    func popVC() // nav view Pop
}
