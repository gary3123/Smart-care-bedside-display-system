//
//  TabBarView.swift
//  Smart care bedside display system
//
//  Created by Gary on 2023/6/11.
//

import UIKit

class CustomTabBarView: UIView {
    // MARK: - IBOutlet
    // 將需要繼承剛剛建立客製化按鈕的 class 宣告
    @IBOutlet weak var personalInformation: ImageButtonView!
    @IBOutlet weak var medicalInformation: ImageButtonView!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var stackView: UIStackView!

    // MARK: - Variables
    
    var onItemsTapped: ((Int) -> ())? = nil
    
    var vcTitleArray: [String] = ["Personal", "Medical"]
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        addXibView()
    }
    
    // view 在設計時想要看到畫面要用這個
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        addXibView()
    }
    
    // MARK: - UI Settings
    // 呼叫 ImageButtonView 的初始化 func
    func setInit() {
        personalInformation.setInit(imageName: "person.text.rectangle",
                        labelText: vcTitleArray[0],
                        index: 0,
                        delegate: self)
        
        medicalInformation.setInit(imageName: "heart.text.square",
                                     labelText: vcTitleArray[1],
                                     index: 1,
                                     delegate: self)
        DispatchQueue
            .main.async {
                let gradient = CAGradientLayer()
                let sizeLength = self.stackView.bounds.size.width
                let frameAndStatusBar = CGRect(x: 0, y: 0, width: sizeLength, height: self.stackView.bounds.size.height)
                gradient.frame = frameAndStatusBar
                gradient.colors = [UIColor.ThemeColor?.cgColor as Any,
                                   UIColor.TintColor?.cgColor as Any]
                gradient.startPoint = CGPoint(x: 0, y: 0)
                gradient.endPoint = CGPoint(x: 1, y: 1)
                gradient.locations = [1,0]
                self.backgroundImage.image = self.image(fromLayer: gradient)
            }
       
    }
    
    func image(fromLayer layer: CAGradientLayer) -> UIImage {
        UIGraphicsBeginImageContext(layer.frame.size)
        layer.render(in: UIGraphicsGetCurrentContext()!)
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        return outputImage
    }
    
    
    // MARK: - IBAction
   
}

// MARK: - Extensions

fileprivate extension CustomTabBarView {
    // 加入畫面
    func addXibView() {
        if let loadView = Bundle(for: CustomTabBarView.self)
            .loadNibNamed("CustomTabBarView",
                          owner: self,
                          options: nil)?.first as? UIView {
            addSubview(loadView)
            loadView.frame = bounds
            setInit()
        }
    }
}


// MARK: - CustomFavoriteButtonDelegate

extension CustomTabBarView: ImageButtonViewDelegate {
    
    // 把點選的值放進 onItemsTapped 閉包中
    func imageButtonView(didClickAt index: Int) {
        onItemsTapped?(index)
    }
}

// MARK: - Protocol

