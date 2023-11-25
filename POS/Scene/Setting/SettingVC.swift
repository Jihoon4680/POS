import UIKit

var data: [MenuModel] = [
    MenuModel(menuName: "김치전", price: 10000, menuCategory: 0),
    MenuModel(menuName: "제육볶음", price: 12000, menuCategory: 0),
    MenuModel(menuName: "순대볶음", price: 15000, menuCategory: 0),
    MenuModel(menuName: "소주", price: 4000, menuCategory: 1),
    MenuModel(menuName: "맥주", price: 4000, menuCategory: 1),
    MenuModel(menuName: "막걸리", price: 4000, menuCategory: 1),
]

class SettingVC: UIViewController {
    
    let vm = SettingVM(menuList: data)
    
    lazy var settingTopInfoView: SettingTopInfoView = {
        let view = SettingTopInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var menuCollectionView: SettingCollectionView = {
        let cv = SettingCollectionView(frame: .zero, collectionViewLayout: SettingCollectionView.layout())
        
        cv.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        cv.register(MenuHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MenuHeaderView.identifier)
        
        cv.backgroundColor = .white
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        return cv
    }()
    
    lazy var food: PosLabel = {
        let label = PosLabel()
        label.text = "요리"
        label.textColor = .black
        label.setFontType(type: .Medium, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var drink: PosLabel = {
        let label = PosLabel()
        label.text = "주류"
        label.textColor = .black
        label.setFontType(type: .Medium, size: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureHierarchy()
        setupCV()
    }
    
    
    func configureHierarchy() {
        self.view.addSubview(settingTopInfoView)
        
        NSLayoutConstraint.activate([
            settingTopInfoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            settingTopInfoView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            settingTopInfoView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            settingTopInfoView.heightAnchor.constraint(equalToConstant: 64),
        ])
    }
    
    private func setupCV() {
        let views: [UIView] = [menuCollectionView]
        views.forEach { view in
            self.view.addSubview(view)
        }
        
        NSLayoutConstraint.activate([
            self.menuCollectionView.widthAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.widthAnchor),
//            self.menuCollectionView.heightAnchor.constraint(equalToConstant: 300),
            self.menuCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.menuCollectionView.topAnchor.constraint(equalTo: settingTopInfoView.bottomAnchor, constant: 24)
        ])
    }
}

extension SettingVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return vm.numberOfSections(in: collectionView)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return vm.collectionView(collectionView, numberOfItemsInSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return vm.collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return vm.collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
}

extension SettingVC: UICollectionViewDelegate {
    
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
