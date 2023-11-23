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

struct OrderList {
    let table_no : String // 테이블 번호
    var menuList : MenuList // 주문한 메뉴 목록
    let totalMenuCount : Int // 총 주문 개수
    let totalPrice : Int // 총 주문 금액
}
