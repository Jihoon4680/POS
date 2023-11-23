//
//  CorrdinatorVCContainer.swift
//  POS
//
//  Created by Jihoon on 2023/11/04.
//

import Foundation

protocol SceneContainer {
    var splashVC : SplashVC? { get set}
    var mainVC : MainVC? { get set}
    var popupVC : MainVC? { get set}
    
}
