//
//  MenuModel.swift
//  POS
//
//  Created by Jihoon on 2023/11/25.
//

import Foundation

struct MenuModel {
    var id = UUID()
    var menuName : String
    var price : Int
    var menuCategory : Int
    //0: 요리, 1: 주류
}
