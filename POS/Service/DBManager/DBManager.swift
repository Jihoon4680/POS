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
    
    var realm: Realm {
        get {
            do {
                let realm = try Realm()
                return realm
            }
            catch {
                print("Could not access realm database: ", error)
            }
            return self.realm
        }
    }
    
    /*
     1. 메뉴,테이블수,메뉴리스트 -> 하루 단위로 끊어서 저장 할 필요 X
     2. 오늘의 매출, 현재 테이블에 메뉴가 저장되어있는 것 이것은 저장 해놔야함. -> 마지막에 설정하자. + 영업 시작 개시를 또 설정해야함
     */
   
   
}


//MARK: 기본 기능 CRUD

extension DBManager {
    //realm경로 -> DB 볼 때 편함
    func getLocationOfDefaultRealm() {
        print("Realm is located at:", realm.configuration.fileURL!)
    }
    
    // 읽기
    func read<T: Object>(_ object: T.Type) -> Results<T> {
        return realm.objects(object)
    }
    // 추가
    func write<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.add(object, update: .modified)
                print("New Item")
            }
            
        } catch let error {
            print(error)
        }
    }
    // 변경
    func update<T: Object>(_ object: T, completion: @escaping ((T) -> ())) {
        do {
            try realm.write {
                completion(object)
            }
            
        } catch let error {
            print(error)
        }
    }
    // 삭제
    func delete<T: Object>(_ object: T) {
        do {
            try realm.write {
                realm.delete(object)
                print("Delete Success")
            }
            
        } catch let error {
            print(error)
        }
    }
    // 정렬
    func sort<T: Object>(_ object: T.Type, by keyPath: String, ascending: Bool = true) -> Results<T> {
        return realm.objects(object).sorted(byKeyPath: keyPath, ascending: ascending)
    }
}
