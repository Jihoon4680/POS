//
//  UIViewController+Etx.swift
//  POS
//
//  Created by Jihoon on 2023/10/30.
//

import Foundation
import UIKit
import SwiftUI

extension UIViewController {
    
    
    
}

//MARK: PreView 관련 Ext
#if DEBUG
import SwiftUI

extension UIViewController {
    
    private struct VCRepresentable : UIViewControllerRepresentable {
        
        let viewController : UIViewController
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        }
        
        func makeUIViewController(context: Context) -> some UIViewController {
            return viewController
        }
        
    }
    func getPreview() -> some View {
        VCRepresentable(viewController: self)
    }
}
#endif
