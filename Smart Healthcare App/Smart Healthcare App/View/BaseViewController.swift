//
//  BaseViewController.swift
//  Smart Healthcare App
//
//  Created by Gary on 2023/6/8.
//

import UIKit

class BaseViewController: UIViewController {
 
    // 設定 Navigation Bar
    func setNavigationbar(backgroundcolor: UIColor?,
                          tintColor: UIColor = .white,
                          foregroundColor: UIColor = .white) {
        DispatchQueue.main.async {
            let appearence = UINavigationBarAppearance()
            appearence.configureWithOpaqueBackground()
            appearence.backgroundColor = backgroundcolor
            self.navigationController?.navigationBar.tintColor = tintColor
            appearence.titleTextAttributes = [
                NSAttributedString.Key.foregroundColor : foregroundColor,
                NSAttributedString.Key.font: UIFont(name: "Timeburner", size: 20)!
            ]
            
            self.navigationController?.navigationBar.standardAppearance = appearence
            self.navigationController?.navigationBar.scrollEdgeAppearance = appearence
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationItem.backButtonTitle = ""
        }
    }
    
    // 點擊螢幕收起鍵盤
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func setNavigationbarGradientColor() {
        let gradient = CAGradientLayer()
        let sizeLength = self.view.bounds.size.width
        let frame
    }
}
