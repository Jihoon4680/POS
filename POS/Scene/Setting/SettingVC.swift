import UIKit

class SettingVC: UIViewController {
    
    let data = [
        MenuModel(menuName: "aaa", price: 10000, isDrink: false),
        MenuModel(menuName: "ddddd", price: 12000, isDrink: false),
        MenuModel(menuName: "순대볶음", price: 15000, isDrink: false),
        MenuModel(menuName: "소주", price: 4000, isDrink: true),
        MenuModel(menuName: "aaa", price: 10000, isDrink: false),
        MenuModel(menuName: "ddddd", price: 12000, isDrink: false),
    ]
    lazy var settingTopInfoView: SettingTopInfoView = {
        let view = SettingTopInfoView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var menuCollectionView: SettingCollectionView = {
        let cv = SettingCollectionView(frame: .zero, collectionViewLayout: SettingCollectionView.layout())
        cv.translatesAutoresizingMaskIntoConstraints = false
        
        cv.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: MenuCollectionViewCell.identifier)
        cv.dataSource = self
        cv.delegate = self
        
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
        setupDrinkView()
    }
    
    
    func configureHierarchy() {
        self.view.addSubview(settingTopInfoView)
        self.view.addSubview(food)
        
        NSLayoutConstraint.activate([
            settingTopInfoView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            settingTopInfoView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            settingTopInfoView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            settingTopInfoView.heightAnchor.constraint(equalToConstant: 64),
            
            food.topAnchor.constraint(equalTo: settingTopInfoView.bottomAnchor, constant: 20),
            food.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 24),
            food.heightAnchor.constraint(equalToConstant: 35)
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
            self.menuCollectionView.topAnchor.constraint(equalTo: food.bottomAnchor, constant: 0)
        ])
    }
    
    private func setupDrinkView() {
        self.view.addSubview(drink)
        
        NSLayoutConstraint.activate([
            drink.topAnchor.constraint(equalTo: menuCollectionView.bottomAnchor, constant: 10),
            drink.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 24),
            drink.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
}

extension SettingVC: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return data.filter { !$0.isDrink }.count
        default:
            return data.filter { $0.isDrink }.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectionViewCell.identifier, for: indexPath) as! MenuCollectionViewCell
        let item = data[indexPath.row]
        
        cell.menuNameLabel.text = item.menuName
        cell.menuPriceLabel.text = Base.shared.seperateComma(text: "\(item.price)") + "원"
        cell.backgroundColor = item.isDrink ? UIColor.menuDrinkViewBg : UIColor.menuFoodViewBg
        return cell
    }
}

extension SettingVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("User is tapped \(indexPath.row) cell")
        print("\(indexPath.section)")
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
