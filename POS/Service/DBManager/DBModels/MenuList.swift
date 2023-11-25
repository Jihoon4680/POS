//
//  MenuList.swift
//  POS
//
//  Created by Jihoon on 2023/11/20.
//

import Foundation
import RealmSwift

class MenuList : Object {
    @Persisted var list : List<Menu?>
    
    convenience init(list: List<Menu?> ) {
        self.init()
        self.list = list
    }
}

