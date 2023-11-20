//
//  TableNumModel.swift
//  POS
//
//  Created by Jihoon on 2023/11/20.
//

import Foundation
import RealmSwift

/// 매장 테이블 숫자
class tableNumModel : Object{
    @Persisted var tableNum : Int?
}
