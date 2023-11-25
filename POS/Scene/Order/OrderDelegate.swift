//
//  OrderDelegate.swift
//  POS
//
//  Created by Jihoon on 2023/11/25.
//

import Foundation

protocol OrderDelegate : AnyObject {
    func finishOrder() // 주문하기 눌렀을 때 ( 이러면 주문한 메뉴가 담긴 모델이 와야함 ) 
}
