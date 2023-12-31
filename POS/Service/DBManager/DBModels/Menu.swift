//
//  Menu.swift
//  POS
//
//  Created by Jihoon on 2023/11/20.
//

import Foundation
import RealmSwift
class Menu : Object {
    @Persisted var name : String // 이름
    @Persisted var price : Int // 가격
    @Persisted var category_no : Int // 카테고리 번호 ( 정렬 기준 )
    
    init(name: String, price: Int, category_no: Int) {
        self.name = name
        self.price = price
        self.category_no = category_no
    }

}
