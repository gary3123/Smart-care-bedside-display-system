//
//  Login.swift
//  Smart Healthcare App
//
//  Created by Gary on 2023/6/4.
//

import UIKit

class Login: BaseViewController {
    // MARK: - IBOutlet
    @IBOutlet weak var loginView: UIView?
    @IBOutlet weak var loginButton: UIButton?
    @IBOutlet weak var accountTextField: UITextField?
    @IBOutlet weak var passwordTextField: UITextField?
    
    // MARK: - Variables
    
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.insertSubview(AlphaBackgroundView(imageName: "login background.png", alpha: 1), at: 0)
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Setup
    
    func setup() {
        setLoginView()
        setTextField()
        setNavigationbarGradientColor()
    }
    
    func setTextField() {
        // 帳號 UI 設置
        accountTextField?.layer.cornerRadius = 20
        accountTextField?.layer.borderColor = UIColor.lightText.cgColor
        accountTextField?.layer.borderWidth = 2
        accountTextField?.backgroundColor = .clear
        accountTextField?.layer.masksToBounds = true
        accountTextField?.setTextFieldImage(systemImageName: "person.crop.rectangle",
                                            imageX: 13,
                                            imageY: 5,
                                            imageWidth: 40,
                                            imageheight: 30)
        // 密碼 UI 設置
        passwordTextField?.layer.cornerRadius = 20
        passwordTextField?.layer.borderColor = UIColor.lightText.cgColor
        passwordTextField?.layer.borderWidth = 2
        passwordTextField?.backgroundColor = .clear
        passwordTextField?.layer.masksToBounds = true
        passwordTextField?.setTextFieldImage(systemImageName: "lock.rectangle",
                                             imageX: 13,
                                             imageY: 5,
                                             imageWidth: 40,
                                             imageheight: 30)
        passwordTextField?.isSecureTextEntry = true
    }
    
    func setLoginView() {
        DispatchQueue.main.async {
            self.loginView?.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0)
            let blueEffect = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: blueEffect)
            blurView.backgroundColor = UIColor(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 0.1)
            blurView.frame.size = CGSize(width: self.loginView!.frame.width, height: self.loginView!.frame.height)
            blurView.layer.cornerRadius = 20
            blurView.layer.masksToBounds = true
            self.loginButton?.layer.cornerRadius = 30
            self.loginButton?.layer.borderWidth = 2
            self.loginButton?.layer.borderColor = UIColor.lightText.cgColor
            self.loginButton?.setImage(UIImage(systemName: "arrow.backward"), for: .normal)
            self.loginButton?.tintColor = .white
            self.loginButton?.semanticContentAttribute = .forceRightToLeft
            self.loginView?.addSubview(blurView)
            
        }
        
    }
    
    
    // MARK: - IBAction
    
    @IBAction func clickLogin() {
        let nextVC = ScanQRCodeViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

// MARK: - Extension

