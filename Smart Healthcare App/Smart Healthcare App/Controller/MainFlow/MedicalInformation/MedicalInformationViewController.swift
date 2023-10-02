//
//  MedicalInformationViewController.swift
//  Smart care bedside display system
//
//  Created by Gary on 2023/6/11.
//

import UIKit

class MedicalInformationViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var dpkTimeRecords: UIDatePicker?
    @IBOutlet weak var tbvMedicalRecords: UITableView?
    
    // MARK: - Variables
    
    var medicalRecords: [GetMedicalRecordsResponse] = []
    let manager = NetworkManager()
    let drugClassString = ["注射", "口服", "外用", "其他"]
    
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
        let formatter = DateFormatter()
        let dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: Date())
        callGetMedicalRecordsApi(date: date)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    // MARK: - UI Settings
    
    func setupUI() {
        setupTableView()
        setupDatePicker()
    }
    
    func setupTableView() {
        tbvMedicalRecords?.register(UINib(nibName: "MedicalRecodersTableViewCell", bundle: nil),
                                    forCellReuseIdentifier: MedicalRecodersTableViewCell.identified)
        tbvMedicalRecords?.delegate = self
        tbvMedicalRecords?.dataSource = self
    }
    
    func setupDatePicker() {
        dpkTimeRecords?.addTarget(self, action: #selector(datePickerChangedValue), for: .valueChanged)
    }
    
    @objc func datePickerChangedValue(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        let dateFormat = "yyyy-MM-dd"
        formatter.locale = Locale.init(identifier: "zh_CN")
        formatter.dateFormat = dateFormat
        let date = formatter.string(from: sender.date)
        callGetMedicalRecordsApi(date: date)
    }
    
    // MARK: - CallGetMedicalRecordsAPI
    
    func callGetMedicalRecordsApi(date: String) {
        let request: GetMedicalRecordsRequest = GetMedicalRecordsRequest(medicalRecordNumber: SingletonOfPatient.shared.medicalRecordNumber, medicalRecordID: 1, date: date)
        medicalRecords = []
        Task {
            do {
                let result: GeneralResponse<[GetMedicalRecordsResponse]> = try await manager.requestData(method: .post,
                                                           path: .getMedicalRecord,
                                                           parameters: request)
                result.data?.forEach({ medicalRecord in
                    medicalRecords.append(GetMedicalRecordsResponse(time: medicalRecord.time,
                                                                    drugName: medicalRecord.drugName,
                                                                    drugClass: medicalRecord.drugClass,
                                                                    note: medicalRecord.note,
                                                                    id: medicalRecord.id))
                })
                tbvMedicalRecords?.reloadData()
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: - IBAction
    
}

// MARK: - Extension

extension MedicalInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicalRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvMedicalRecords?.dequeueReusableCell(withIdentifier: MedicalRecodersTableViewCell.identified, for: indexPath) as! MedicalRecodersTableViewCell
        cell.lbTime.text = medicalRecords[indexPath.row].time
        cell.lbDrugName.text = medicalRecords[indexPath.row].drugName
        cell.lbDrugClass.text = drugClassString[medicalRecords[indexPath.row].drugClass]
        cell.txvNote.text = medicalRecords[indexPath.row].note
        return cell
    }
}

// MARK: - Protocol

