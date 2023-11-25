//
//  Menu.swift
//  POS
//
//  Created by Jihoon on 2023/11/20.
//

import Foundation
import RealmSwift
class Menu: Object {
    
    @Persisted var name: String = ""  // 이름
    @Persisted var price: Int = 0     // 가격
    @Persisted var category_no: Int = 0  // 카테고리 번호 ( 정렬 기준 )
    
    convenience init(name: String, price: Int, category_no: Int) {
        self.init()
        self.name = name
        self.price = price
        self.category_no = category_no
    }
}
