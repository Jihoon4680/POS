//
//  Base.swift
//  POS
//
//  Created by Jihoon on 2023/11/11.
//

import Foundation
import UIKit

class Base : NSObject{
    
    static let shared  = Base()
    
    let currentFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년MM월dd일 a hh시mm분"
        formatter.locale = Locale(identifier:"ko_KR")
        return formatter
    }()
    
    private override init() { }
    
    /**
     Date : 2023 . 11 . 16
     author :  jhAhn
     Parameter :
     Return : String  // ex) 현재 시간 2023년11월16일 오후 11시 09분
     */
    func getCurrentDateStr() -> String{
        let nowDate = Date()
        return currentFormatter.string(from: nowDate)
    }
    
    
    
}
