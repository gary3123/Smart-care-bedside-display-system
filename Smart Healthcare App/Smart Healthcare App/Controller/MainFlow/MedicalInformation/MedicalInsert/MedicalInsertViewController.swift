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
    @IBOutlet weak var btnSave: UIButton!
    
    // MARK: - Variables
    let drugNames = [
        "SILICEA",
        "Naproxen",
        "Moisturizing Antibacterial",
        "Quick Action",
        "Cuprum aceticum Nicotiana",
        "Mekinist",
        "Glimepiride",
        "Methocarbamol",
        "anti itch",
        "NP Thyroid 120",
        "ChloraPrep One-Step",
        "Rescue Sleep",
        "Pain Reliever Extra Strength",
        "Tussin CF Non Drowsy Multi Symptom"
    ]
    
    let medicalTypeTitle = ["注射", "口服"]
    let medicalType = ["Injection", "oral"]
    var selectMedicalTypeIndex: Int? = nil
    
    var selectDrugName: String = ""
    
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
        setupBtnSave()
    }
    
    func setupTableView() {
        tbvMedicalInsert.register(UINib(nibName: "TextFieldTableViewCell", bundle: nil), forCellReuseIdentifier: TextFieldTableViewCell.identified)
        tbvMedicalInsert.register(UINib(nibName: "TextViewTableViewCell", bundle: nil), forCellReuseIdentifier: TextViewTableViewCell.identified)
        tbvMedicalInsert.register(UINib(nibName: "DatePickerTableViewCell", bundle: nil), forCellReuseIdentifier: DatePickerTableViewCell.identified)
        tbvMedicalInsert.register(UINib(nibName: "MedicalTypeTableViewCell", bundle: nil), forCellReuseIdentifier: MedicalTypeTableViewCell.identified)
        tbvMedicalInsert.dataSource = self
        tbvMedicalInsert.delegate = self
    }
    
    func setupBtnSave() {
        btnSave.layer.cornerRadius = 30
    }
    
    // MARK: - IBAction
    
    @IBAction func clickBtnSave() {
        self.navigationController?.popViewController(animated: true)
    }
    
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
            cell.txfMedicalName.text = selectDrugName
            cell.txfMedicalName.delegate = self
            return cell
        case 1:
            let cell = tbvMedicalInsert.dequeueReusableCell(withIdentifier: MedicalTypeTableViewCell.identified, for: indexPath) as! MedicalTypeTableViewCell
            if selectMedicalTypeIndex == nil {
                cell.lbMedicalType.text = ""
            } else {
                cell.lbMedicalType.text = medicalTypeTitle[selectMedicalTypeIndex!]
            }
            return cell
        case 2:
            let cell = tbvMedicalInsert.dequeueReusableCell(withIdentifier: DatePickerTableViewCell.identified, for: indexPath) as! DatePickerTableViewCell
            return cell
        default:
            let cell = tbvMedicalInsert.dequeueReusableCell(withIdentifier: TextViewTableViewCell.identified, for: indexPath) as! TextViewTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            Alert.showActionSheet(array: medicalTypeTitle, canceltitle: "取消", vc: self) { selectIndex in
                self.selectMedicalTypeIndex = selectIndex
                self.tbvMedicalInsert.reloadData()
            }
        }
    }
}

// MARK: - Protocol



extension MedicalInsertViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        selectDrugName = textField.text!
    }
}


