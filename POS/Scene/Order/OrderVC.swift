//
//  File.swift
//  POS
//
//  Created by Jihoon on 11/24/23.
//

import Foundation
import UIKit

class OrderVC : UIViewController {
    
    lazy var topOrderView : TopOrderView = {
        let view = TopOrderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var paymentView : PaymentView = {
        let view = PaymentView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
}
