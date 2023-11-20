//
//  DBManager.swift
//  POS
//
//  Created by Jihoon on 2023/11/07.
//

import Foundation
import UIKit
import RealmSwift

class DBManager {
    
    static let shared = DBManager()
    
    let realm = try! Realm()
    
}
