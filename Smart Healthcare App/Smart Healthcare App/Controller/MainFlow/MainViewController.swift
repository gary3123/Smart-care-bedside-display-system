//
//  MainViewController.swift
//  Smart Healthcare App
//
//  Created by Gary on 2023/6/9.
//

import UIKit

class MainViewController: BaseViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var tabBarView: CustomTabBarView!
    
    // MARK: - Variables
    
    var vc: [UIViewController] = []
    var personalInformationVC = PersonalInformationViewController()
    var medicalInformationVC = MedicalInformationViewController()
    var addRecordBarButtonItem = UIBarButtonItem()
    
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        vc = [personalInformationVC,medicalInformationVC]
        
        // 預設進來的頁面是第 1 頁
        updateView(index: 0)
        
        setupUI()
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setNavigationBar()
        tabBarView.onItemsTapped = {
            self.updateView(index: $0) // $0 從第一個開始掃描
        }
        tabBarView.layer.cornerRadius = 20
        tabBarView.layer.masksToBounds = true
    }
    
    func updateView(index: Int) {
        // 會逐個掃描，並把 vc 裡 children 沒有的 view 放進 children 裡
        if children.first(where: { String(describing: $0.classForCoder) == String(describing: vc[index].classForCoder) }) == nil {
            addChild(vc[index])
            vc[index].view.frame = containerView.bounds
        }
        navigationItem.title = tabBarView.vcTitleArray[index]
        // 將中間的 container 替換成閉包, delegate 帶進來的值
        containerView.addSubview(vc[index].view)
        if index == 1 {
            self.navigationItem.rightBarButtonItems = [addRecordBarButtonItem]
        } else {
            self.navigationItem.rightBarButtonItems = []
        }
        
    }
    
    func setNavigationBar() {
        navigationController?.isNavigationBarHidden = false
        navigationItem.backButtonTitle = ""
        addRecordBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus"), style: .plain, target: self, action: #selector(clickAddRecordBarButtonItem))
    }
    
    @objc func clickAddRecordBarButtonItem() {
        let nextVC = MedicalInsertViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    
    // MARK: - IBAction
    
    
    // MARK: - onItemsTapped
    private func onItemsTapped(index: Int) {
        updateView(index: index)
    }
    
}


// MARK: - Protocol
