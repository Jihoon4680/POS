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
    
    var currentSalesDateStr : String = ""
    
    let currentFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년MM월dd일 a hh시mm분"
        formatter.locale = Locale(identifier:"ko_KR")
        return formatter
    }()
    
    let salesDateFormatter : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
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
    
    /*
     // MARK: - 영업시간 저장
     영업시간 저장
     @ date 2023.11.24
     @ author jhahn
     */
//    func setSalesStart(dateStr : String){
//        UserDefaults.standard.setValue(dateStr, forKey: SALES_DATE_KEY)
//    }
//    
//    /*
//     // MARK: - 영업 개시 확인
//     영업개시 여부 확인해준다. ( 영업개시 팝업띄우기위해 )
//     테이블 클릭 시 영업개시 여부에 따라 시작, 끝을 나눔
//     이전 날의 영업종료 하지 않아도 초기화 시켜줘야함
//     @ date 2023.11.24
//     @ author jhahn
//     @ return Bool / true : 영업개시 중 , false : 영업시작 팝업을 띄움
//     */
//    func checkSales() {
//        
//        let nowDateStr = salesDateFormatter.string(from: Date()) // 현재 날짜
//        guard let nowDate = salesDateFormatter.date(from: nowDateStr) else { return }
//        
//        if let localDateStr = UserDefaults.standard.value(forKey: SALES_DATE_KEY){
//            
//            let localDate = salesDateFormatter.date(from: localDateStr as! String )
//            
//            var timeSince = Int(localDate?.timeIntervalSince(nowDate) ?? 0 ) / 3600 // 저장된 시간과 현재시간의 차이를 구한다.
//            
//            print(#fileID, #function, #line, " jh.ahn  - current : \(nowDate), local : \(String(describing: localDate)), since \(timeSince)")
//            
//            if( timeSince >= 24){ // 영업개시 시작보다 24시간 후라면
//                SceneManager.shared.showPopup(type: .TwoButton, title: "알림", body: "영업시작하시겠습니까") {
//                    // 영업 시작 하면 그때 저장을 누르면 됨
//                    Base.shared.setSalesStart(dateStr: nowDateStr)
//                }
//            }
//        }else {
//            SceneManager.shared.showPopup(type: .TwoButton, title: "알림", body: "영업시작하시겠습니까") {
//                // 영업 시작 하면 그때 저장을 누르면 됨
//                Base.shared.setSalesStart(dateStr: nowDateStr)
//            }
//        }
//
//    }
//    func endSales(){
//        UserDefaults.standard.set(nil, forKey: SALES_DATE_KEY)
//    }
    
    // 숫자에 , 찍기 ( ex. 10,000 )
    func seperateComma(text : String) -> String{
        
        let  formatter = NumberFormatter()
        formatter.numberStyle = .decimal // 1,000,000
        formatter.locale = Locale.current
        formatter.maximumFractionDigits = 0 // 허용하는 소숫점 자리수
        
        let strToInt = Int(text) ?? 0
    
        let commaInt = formatter.string(from: NSNumber(value: strToInt)) ?? "0"
        return String(commaInt)
        
    }

    
}
