//
//  File.swift
//  POS
//
//  Created by Jihoon on 11/24/23.
//

import Foundation
import UIKit

class OrderMenuView: UIView {
    
//    lazy var menuCV : MenuCollectionView = {
//        let cv = MenuCollectionView(frame: , collectionViewLayout: )
//    }()()
//    
    override init(frame : CGRect){
        super.init(frame: frame)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension OrderMenuView {
    
    
}
import SwiftUI

@available(iOS 13, *)
struct OrderMenuView_PreView: PreviewProvider {
    static var previews: some View {
        
        PaymentView()
            .getPreview()
            .previewLayout(.fixed(width: 375, height:756))
    }
}
