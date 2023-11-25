//
//  MainTableView.swift
//  POS
//
//  Created by Jihoon on 2023/11/17.
//

import UIKit

class OrderTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension OrderTableView {
    func configure(){
        
    }
}
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct OrderTableView_PreView: PreviewProvider {
    static var previews: some View {
        
        OrderTableView(frame: .zero, style: .plain)
            .getPreview()
            .previewLayout(.fixed(width: 375, height:749))
    }
}
#endif
