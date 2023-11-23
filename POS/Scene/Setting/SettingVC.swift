//
//  SettingVC.swift
//  POS
//
//  Created by seobe22 on 11/22/23.
//

import UIKit

class SettingVC: UIViewController {
    
    lazy var settingTopInfoView: SettingTopInfoView = {
        let view = SettingTopInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureHierarchy()
    }
    

    func configureHierarchy() {
        self.view.addSubview(settingTopInfoView)
        
        NSLayoutConstraint.activate([
            settingTopInfoView.topAnchor.constraint(equalTo: self.view.topAnchor),
            settingTopInfoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            settingTopInfoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
    }
}

#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct SettingVC_PreView: PreviewProvider {
    static var previews: some View {
        SettingVC()
            .getPreview()
    }
}
#endif
