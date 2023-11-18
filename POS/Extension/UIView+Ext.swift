//
//  UIView+Ext.swift
//  POS
//
//  Created by Jihoon on 2023/11/04.
//

import Foundation
import UIKit

extension UIView  {
    
    // 그림자 효과
    private func addShadow(shadowColor: CGColor = UIColor.black.cgColor,
                           shadowOffset: CGSize = CGSize(width: 1.0, height: 2.0),
                           shadowOpacity: Float = 0.4,
                           shadowRadius: CGFloat = 3.0){
                layer.shadowColor = shadowColor
                layer.shadowOffset = shadowOffset
                layer.shadowOpacity = shadowOpacity
                layer.shadowRadius = shadowRadius
    }
    // 둥근모서리
    private func setConerRadius(value : CGFloat){
        layer.cornerRadius = value
    }

}

//MARK: PreView 관련 Ext
#if DEBUG
import SwiftUI

extension UIView {
    
    private struct ViewRepresentable : UIViewRepresentable {
        
        let uiview : UIView
        
        func updateUIView(_ uiView: UIViewType, context: Context) {
            uiview.setContentHuggingPriority(.defaultHigh, for: .horizontal)
            uiview.setContentHuggingPriority(.defaultHigh, for: .vertical)
        }
        
        func makeUIView(context: Context) -> some UIView {
            return uiview
        }
        
    }
    func getPreview() -> some View {
        ViewRepresentable(uiview: self)
    }
    
}


#endif
