//
//  OrderedList.swift
//  POS
//
//  Created by Jihoon on 2023/11/26.
//

import Foundation
import RealmSwift

class OrderedMenu : Object {
    @Persisted var totalPrice : String // 총 가격
    @Persisted var totalCount : Int // 총 수량
    @Persisted var menu : Menu // 메뉴 정보  
    
    convenience init( totalPrice : Int, totalCount : Int, menu : Menu){
        self.init()
        self.totalPrice = totalCount
        self.totalCount = totalCount
        self.menu = menu
    }

}
