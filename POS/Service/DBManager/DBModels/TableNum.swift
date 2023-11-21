//
//  TableNumModel.swift
//  POS
//
//  Created by Jihoon on 2023/11/20.
//

import Foundation
import RealmSwift

/// 매장 테이블 숫자
class TableNum : Object{
    @Persisted var tableNum : Int? // 테이블 수가 없을 수도 있기 때문에 optional
    
    init(tableNum: Int? = nil) {
        self.tableNum = tableNum
    }
}
