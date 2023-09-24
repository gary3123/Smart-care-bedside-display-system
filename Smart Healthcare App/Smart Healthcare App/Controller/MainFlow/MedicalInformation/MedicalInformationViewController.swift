//
//  MedicalInformationViewController.swift
//  Smart care bedside display system
//
//  Created by Gary on 2023/6/11.
//

import UIKit

class MedicalInformationViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var datePicker: UIDatePicker?
    
    // MARK: - Variables
    var addRecordBarButtonItem = UIBarButtonItem()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupNavigation()
    }
    
    func setupNavigation() {
        
    }
    
    @objc func clickAddRecordBarButtonItem() {
        
    }
    
    // MARK: - IBAction
    
}

// MARK: - Extension

// MARK: - Protocol

