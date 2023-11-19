//
//  TableCollectionViewCell.swift
//  POS
//
//  Created by Jihoon on 2023/11/17.
//

import UIKit

class TableCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TableCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
        print(#fileID,#function,#line," jh.ahn - <#comment#> ")
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
}

extension TableCollectionViewCell {
    func configure(){
        print(#fileID,#function,#line," jh.ahn - <#comment#> ")
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = UIColor.tableBorder.cgColor
        layer.cornerRadius = 16
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct TableCollectionViewCell_PreView: PreviewProvider {
    static var previews: some View {
        
        TableCollectionViewCell()
            .getPreview()
            .previewLayout(.fixed(width: 168, height: 136))
    }
}
#endif

