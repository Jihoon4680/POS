//
//  CurrentSalesList.swift
//  POS
//
//  Created by Jihoon on 11/23/23.
//

import Foundation
import RealmSwift

class OrderedMenuList : Object {
    @Persisted var tableNum : Int // 테이블 번호
    @Persisted var payDate : Date // 주문완료시간 // 결제 시 결제완료 시간
    @Persisted var totalPrice : Int // 총 가격
    @Persisted var totalCount : Int // 총 수량
    @Persisted var menu : List<OrderedMenu> // 주문된 메뉴 정보
    
    convenience init(tableNum : Int, payDate : Date, totalPrice : Int, totalCount : Int, menu : List<OrderedMenu>){
        self.init()
        self.tableNum = tableNum
        self.payDate = payDate
        self.totalPrice = totalCount
        self.totalCount = totalCount
        self.menu = menu
    }

}
