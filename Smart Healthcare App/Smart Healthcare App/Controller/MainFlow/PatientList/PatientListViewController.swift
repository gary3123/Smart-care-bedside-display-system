//
//  PatientListViewController.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/9/24.
//

import UIKit
import ProgressHUD
import RealmSwift

class PatientListViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var tvPatientList: UITableView?
    @IBOutlet weak var btnSignOut: UIButton?
    
    // MARK: - Variables
    
    var scanQrCodeBarButtonItem = UIBarButtonItem()
    let manager = NetworkManager()
    let realm = try! Realm()
    var patientList: [PatientsStruct]? = []
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PatientList"
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesBackButton = true
        setupUI()
        setupTableView()
        setupNavigation()
        ProgressHUD.showSucceed()
        // 建立 Notification 接收者
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(reloadTableView),
                                               name: .reloadPatientsTableView,
                                               object: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchRealmItem()
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
        setupBtnSignOut()
    }
    
    func setupTableView() {
        tvPatientList?.register(UINib(nibName: "PatientTableViewCell", bundle: nil), forCellReuseIdentifier: PatientTableViewCell.identified)
        tvPatientList?.dataSource = self
        tvPatientList?.delegate = self
    }
    
    func setupBtnSignOut() {
        btnSignOut?.layer.cornerRadius = 35
    }
    
    func setupNavigation() {
        scanQrCodeBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "qrcode.viewfinder"), style: .plain, target: self, action: #selector(clickScanQRcode))
        self.navigationItem.rightBarButtonItem = scanQrCodeBarButtonItem
        navigationItem.backButtonTitle = ""
    }
    
    func fetchRealmItem() {
        patientList = []
        let fetchToRealm = realm.objects(PatientsRealmModel.self)
        for patient in fetchToRealm {
            let item = PatientsStruct(id: patient._id,
                                      medicalRecordID: patient.medicalRecordID,
                                      name: patient.name,
                                      medicalRecordNumber: patient.medicalRecordNumber,
                                      wardNumber: patient.wardNumber,
                                      bedNumber: patient.bedNumber)
            patientList?.append(item)
        }
        print("\(realm.configuration.fileURL)")
    }
    
    // MARK: - CallPatientInfoApi
    
    func callpatientInfoApi() {
        let request: PatientInfoRequest = PatientInfoRequest(medicalRecordNumber: SingletonOfPatient.shared.medicalRecordNumber,
                                                             medicalRecordId: SingletonOfPatient.shared.medicalRecordID)
        Task {
            do {
                let result: GeneralResponse<PatientInfoResponse> = try await manager.requestData(method: .post,
                                                                                path: .patientInfo,
                                                                                parameters: request)
                let name = result.data?.name
                let gender = result.data?.gender
                let medicalRecordNumber = result.data?.medicalRecordNumber
                let wardNumber = result.data?.wardNumber
                let birthday = result.data?.birthday
                let bedNumber = result.data?.bedNumber
                let medication = result.data?.medication
                let notice = result.data?.notice
                let cases = result.data?.cases
               
                let nextVC = MainViewController()
                SingletonOfPatient.shared.name = name!
                SingletonOfPatient.shared.gender = gender!
                SingletonOfPatient.shared.medicalRecordNumber = medicalRecordNumber!
                SingletonOfPatient.shared.wardNumber = wardNumber!
                SingletonOfPatient.shared.birthday = birthday!
                SingletonOfPatient.shared.bedNumber = bedNumber!
                SingletonOfPatient.shared.medication = medication!
                SingletonOfPatient.shared.notice = notice!
                SingletonOfPatient.shared.cases = cases!
                navigationController?.pushViewController(nextVC, animated: true)
            } catch {
                print(error)
                Alert.showAlert(title: "連線錯誤", message: "請確認與伺服器有保持連線", vc: self, confirmTitle: "確認")
            }
            
        }
    }
    
    @objc func reloadTableView() {
        fetchRealmItem()
        print(patientList?.count)
        tvPatientList?.reloadData()
    }
    
    // MARK: - IBAction
    
    @objc func clickScanQRcode() {
        let nextVC = ScanQRCodeViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func clickBtnSignOut() {
        try! realm.write {
            let allPatients = realm.objects(PatientsRealmModel.self)
            realm.delete(allPatients)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - tvPatientListExtension

extension PatientListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return patientList!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvPatientList?.dequeueReusableCell(withIdentifier: PatientTableViewCell.identified, for: indexPath) as! PatientTableViewCell
        cell.igvPatient?.image = UIImage(systemName: "person.crop.square.fill")
        cell.lbname?.text = "姓名：\(patientList![indexPath.row].name)"
        cell.lbMRN?.text = "病例號：\(patientList![indexPath.row].medicalRecordNumber)"
        cell.lbWardNum?.text = "病房號：\(patientList![indexPath.row].wardNumber)"
        cell.lbBedNum?.text = "床號：\(patientList![indexPath.row].bedNumber)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SingletonOfPatient.shared.medicalRecordID = patientList![indexPath.row].medicalRecordID
        SingletonOfPatient.shared.medicalRecordNumber = patientList![indexPath.row].medicalRecordNumber
        callpatientInfoApi()
    }
    
}

// MARK: - Protocol

