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
    
    //MARK: 테이블 수 설정
    /**
     Description : 테이블 수 설정
     Date : 2023 . 11 . 21
     author :  JH
     Parameter : num ( Int ) // 설정하고 싶은 테이블 수
     Return :
     */
    func setTableNum(num : Int){
        
    }
    //MARK: 테이블 수 가져오기
    /**
     Description : 저장된 테이블 수 가져오기
     Date : 2023 . 11 . 21
     author :  JH
     Return : Num (Int)
     */
    func getTableNum() -> Int{
        let num = 0
        return num
    }
}
