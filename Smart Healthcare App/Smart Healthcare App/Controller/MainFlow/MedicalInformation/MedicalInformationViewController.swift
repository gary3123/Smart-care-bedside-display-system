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
    
    let manager = NetworkManager()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        callGetMedicalRecordsApi()
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
    
    // MARK: - CallGetMedicalRecordsAPI
    
    func callGetMedicalRecordsApi() {
        let request: GetMedicalRecordsRequest = GetMedicalRecordsRequest(medicalRecordNumber: SingletonOfPatient.shared.medicalRecordNumber, medicalRecordID: 1, date: "2023-10-01")
        Task {
            do {
                let result: GeneralResponse<[GetMedicalRecordsResponse]> = try await manager.requestData(method: .post,
                                                           path: .getMedicalRecord,
                                                           parameters: request)
                print(result)
            } catch {
                print(error)
            }
        }
    }
    
    // MARK: - IBAction
    
}

// MARK: - Extension

// MARK: - Protocol

