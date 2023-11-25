//
//  DaySalesList.swift
//  POS
//
//  Created by Jihoon on 2023/11/26.
//
import Foundation
import RealmSwift

class DaySalesList : Object {
    @Persisted var completeDate : String // 주문완료시간 // 결제 시 결제완료 시간 ( DateFormatter -> 줌 ). 
    @Persisted var totalPrice : Int // 총 가격
    @Persisted var totalCount : Int // 총 수량
    @Persisted var menu : List<OrderedMenu> // 주문된 메뉴 정보
    
    convenience init(completeDate : Int, totalPrice : Int, totalCount : Int, menu : List<OrderedMenu>){
        self.init()
        self.totalPrice = totalCount
        self.totalCount = totalCount
        self.menu = menu
    }
}
