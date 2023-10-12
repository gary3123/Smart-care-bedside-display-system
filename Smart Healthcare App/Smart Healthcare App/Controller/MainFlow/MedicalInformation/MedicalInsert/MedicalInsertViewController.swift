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
    var drugNames: [String] = []
    var medicalTypeInt: [Int] = []
    
    var result: [Medications]? = nil
    let medicalTypeTitle = ["注射", "口服", "外用", "其他"]
    var selectMedicalTypeIndex: Int? = nil
    var selectDrugName: String = ""
    var note = ""
    var selectTime = ""
    let formatter = DateFormatter()
    let dateFormat = "yyyy/MM/dd HH:mm"
    let manager = NetworkManager()
    
    struct Medications: Decodable {
        public var name: String
        public var drug_class: Int
    }
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Medical Record Insert"
        setupUI()
        loadJson(filename: "Medication")
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
    
    func loadJson(filename fileName: String) {
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData: [Medications] = try decoder.decode([Medications].self, from: data)
                
                jsonData.forEach { medication in
                    drugNames.append(medication.name)
                    medicalTypeInt.append(medication.drug_class)
                }
            } catch {
                print("error:\(error)")
            }
        }
    }
    
    // MARK: - CallUploadMedicalRecordAPI
    
    func callUploadMedicalRecordApi() {
        if selectTime.isEmpty {
            formatter.locale = Locale.init(identifier: "zh_CN")
            formatter.dateFormat = dateFormat
            selectTime = formatter.string(from: Date())
        }
        let request: UploadMedicalRecordRequest = UploadMedicalRecordRequest(medicalRecordNumber: SingletonOfPatient.shared.medicalRecordNumber,
                                                                             ms_id: SingletonOfPatient.shared.account,
                                                                             medicalRecordID: SingletonOfPatient.shared.medicalRecordID,
                                                                             medication: selectDrugName,
                                                                             drugClass: selectMedicalTypeIndex!,
                                                                             time: selectTime,
                                                                             notice: note)
        Task {
            do {
                let result: GeneralResponse<String> = try await manager.requestData(method: .post,
                                                                                    path: .uploadMedicalRecord,
                                                                                    parameters: request)
                if result.result == 0 {
                    NotificationCenter.default.post(name: .callGetMedicalRecords, object: nil)
                    navigationController?.popViewController(animated: true)
                } else {
                    Alert.showAlert(title: "上傳失敗", message: "請確認網路連線狀況", vc: self, confirmTitle: "確認")
                }
            } catch {
                print(error)
            }
        }
    }
    
    @objc func datePickerChangedValue(_ sender: UIDatePicker) {
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        selectTime = formatter.string(from: sender.date)
    }
    
    // MARK: - IBAction
    
    @IBAction func clickBtnSave() {
        callUploadMedicalRecordApi()
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
            cell.dpkTakingTime.addTarget(self, action: #selector(datePickerChangedValue), for: .valueChanged)
            return cell
        default:
            let cell = tbvMedicalInsert.dequeueReusableCell(withIdentifier: TextViewTableViewCell.identified, for: indexPath) as! TextViewTableViewCell
            cell.txvNote.delegate = self
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

extension MedicalInsertViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        note = textView.text
    }
}


