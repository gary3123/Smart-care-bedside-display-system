//
//  MedicalInsertViewController.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/9/28.
//

import UIKit
import CCAutocomplete

class MedicalInsertViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tbvMedicalInsert: UITableView!
    
    // MARK: - Variables
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Medical Record Insert"
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
        setupTableView()
    }
    
    func setupTableView() {
        tbvMedicalInsert.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: TextFieldTableViewCell.identified)
        tbvMedicalInsert.register(UINib(nibName: "TextViewTableViewCell", bundle: nil), forCellReuseIdentifier: TextViewTableViewCell.identified)
        tbvMedicalInsert.register(UINib(nibName: "DatePickerTableViewCell", bundle: nil), forCellReuseIdentifier: DatePickerTableViewCell.identified)
        tbvMedicalInsert.register(UINib(nibName: "MedicalTypeTableViewCell", bundle: nil), forCellReuseIdentifier: MedicalTypeTableViewCell.identified)
        tbvMedicalInsert.dataSource = self
        tbvMedicalInsert.delegate = self
    }
    
    // MARK: - IBAction
    
}

// MARK: - Extension

extension MedicalInsertViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tbvMedicalInsert.dequeueReusableCell(withIdentifier: TextFieldTableViewCell.identified, for: indexPath) as! TextFieldTableViewCell
            return cell
        case 1:
            let cell = tbvMedicalInsert.dequeueReusableCell(withIdentifier: MedicalTypeTableViewCell.identified, for: indexPath) as! MedicalTypeTableViewCell
            return cell
        case 2:
            let cell = tbvMedicalInsert.dequeueReusableCell(withIdentifier: DatePickerTableViewCell.identified, for: indexPath) as! DatePickerTableViewCell
            return cell
        default:
            let cell = tbvMedicalInsert.dequeueReusableCell(withIdentifier: TextViewTableViewCell.identified, for: indexPath) as! TextViewTableViewCell
            return cell
        }
    }
}

// MARK: - Protocol

