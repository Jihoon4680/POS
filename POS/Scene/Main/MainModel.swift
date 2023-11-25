//
//  MainView.swift
//  POS
//
//  Created by Jihoon on 2023/11/11.
//

import Foundation

let orderOptionStr = ["테이블", "주문내역", "설정"]

/*
 1. 현재 매출 상황 ( 테이블,메뉴 ( 수량, 이름 ), 총결제금액, 결제시간)
 2. 현재 테이블 상황 ( 테이블,메뉴 ( 수량, 이름) )
 */



struct MainModel {
    let tableInfo : TableInfo
}

struct TableInfo { // 테이블 번호와 주문 정보
    let tableNum : Int
    let orderInfo : OrderInfo
}
struct OrderInfo {
    var orderMenuList : [OrderMenu] // 메뉴이름과 주문 수량
    var totalCount : Int // 총 주문 갯수
    var totalPrice : Int // 총 결제 가격
}
struct OrderMenu {
    let menuName : String
    var menuCount : Int
}
