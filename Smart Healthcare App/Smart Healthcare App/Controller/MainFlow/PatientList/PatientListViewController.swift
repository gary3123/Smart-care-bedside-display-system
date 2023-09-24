//
//  PatientListViewController.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/9/24.
//

import UIKit

class PatientListViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var tvPatientList: UITableView?
    @IBOutlet weak var btnSignOut: UIButton?
    
    // MARK: - Variables
    var scanQrCodeBarButtonItem = UIBarButtonItem()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "PatientList"
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesBackButton = true
        setupUI()
        setupTableView()
        setupNavigation()
       
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
    
    // MARK: - IBAction
    
    @objc func clickScanQRcode() {
        let nextVC = ScanQRCodeViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    @IBAction func clickBtnSignOut() {
        self.navigationController?.popViewController(animated: true)
    }
    
}

// MARK: - tvPatientListExtension

extension PatientListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tvPatientList?.dequeueReusableCell(withIdentifier: PatientTableViewCell.identified, for: indexPath) as! PatientTableViewCell
        cell.igvPatient?.image = UIImage(systemName: "person.crop.square.fill")
        cell.lbname?.text = "姓名：XXX"
        cell.lbMRN?.text = "病例號：XXXXXXX"
        cell.lbWardNum?.text = "病房號：XXXXXX"
        cell.lbBedNum?.text = "床號：XXX"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = MainViewController()
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
}

// MARK: - Protocol

