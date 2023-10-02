//
//  PersonalInformationViewController.swift
//  Smart Healthcare App
//
//  Created by Gary on 2023/6/9.
//

import UIKit
import Lottie

class PersonalInformationViewController: UIViewController {
    
    // MARK: - IBOutlet
    @IBOutlet weak var personalBackgroundView: UIView?
//    @IBOutlet weak var sView: UIView?
//    @IBOutlet weak var oView: UIView?
//    @IBOutlet weak var aView: UIView?
//    @IBOutlet weak var pView: UIView?
    @IBOutlet weak var animateBackgroundView: UIView?
    @IBOutlet weak var tbvMedical: UITableView?
    @IBOutlet weak var tbvMedication: UITableView?
    @IBOutlet weak var tbvNotice: UITableView?
    @IBOutlet weak var scvPatientInfo: UIScrollView?
    @IBOutlet weak var btnMedicalRecords: UIButton?
    @IBOutlet weak var btnMedication: UIButton?
    @IBOutlet weak var btnNotice: UIButton?
    @IBOutlet weak var vSelectShadow: UIView?
    @IBOutlet weak var lbName: UILabel?
    @IBOutlet weak var lbGender: UILabel?
    @IBOutlet weak var lbMedicalRecordNumber: UILabel?
    @IBOutlet weak var lbWardNumber: UILabel?
    @IBOutlet weak var lbBirthday: UILabel?
    @IBOutlet weak var lbBedNumber: UILabel?
//    @IBOutlet weak var vMedicalRecords: UIView?
//    @IBOutlet weak var vMedication: UIView?
//    @IBOutlet weak var vNotice: UIView?
   
    
    // MARK: - Variables
    
    
    // MARK: - LifeCycle
   
    
    override func viewWillAppear(_ animated: Bool) {
        print("PersonalInformationViewController")
        lbName?.text = "姓名：\(SingletonOfPatient.shared.name)"
        lbGender?.text = "性別：\(SingletonOfPatient.shared.gender)"
        lbMedicalRecordNumber?.text = "病例號：\(SingletonOfPatient.shared.medicalRecordNumber)"
        lbWardNumber?.text = "病房號：\(SingletonOfPatient.shared.wardNumber)"
        lbBirthday?.text = "生日：\(SingletonOfPatient.shared.birthday)"
        lbBedNumber?.text = "床號：\(SingletonOfPatient.shared.bedNumber)"
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        setup()
    }
    // MARK: - Setup
    
    func setup() {
        setuppersonalBackgroundView()
//        setupSOAPView()
        setupAnimate()
        setupTableView()
        setupScvPatientInfo()
        setupBtnStyle()
    }
    
    func setuppersonalBackgroundView() {
        personalBackgroundView?.layer.cornerRadius = 20
        personalBackgroundView?.layer.shadowOffset = CGSize(width: 0, height: 0)
        personalBackgroundView?.layer.shadowOpacity = 0.3
        personalBackgroundView?.layer.shadowRadius = 20
        personalBackgroundView?.layer.shadowColor = UIColor.tintColor.cgColor
    }
    
    func setupTableView() {
        tbvMedical?.register(UINib(nibName: "MedicalTableViewCell", bundle: nil), forCellReuseIdentifier: MedicalTableViewCell.identified)
        tbvMedical!.tag = 0
        tbvMedical?.dataSource = self
        tbvMedical?.delegate = self
        
        tbvMedication?.register(UINib(nibName: "MedicationTableViewCell", bundle: nil), forCellReuseIdentifier: MedicationTableViewCell.identified)
        tbvMedication!.tag = 1
        tbvMedication?.dataSource = self
        tbvMedication?.delegate = self
        
        tbvNotice?.register(UINib(nibName: "NoticeTableViewCell", bundle: nil), forCellReuseIdentifier: NoticeTableViewCell.identified)
        tbvNotice!.tag = 2
        tbvNotice?.dataSource = self
        tbvNotice?.delegate = self
    
    }
    
    func setupScvPatientInfo() {
        scvPatientInfo?.delegate = self
    }
    
    func setupBtnStyle() {
        vSelectShadow?.layer.cornerRadius = 20
        vSelectShadow?.layer.shadowOffset = CGSize(width: 5, height: 5)
        vSelectShadow?.layer.shadowOpacity = 0.1
        vSelectShadow?.layer.shadowRadius = 10
    }
//    func setupSOAPView() {
//        sView?.layer.cornerRadius = 20
//        sView?.layer.shadowOffset = CGSize(width: 5, height: 5)
//        sView?.layer.shadowOpacity = 0.1
//        sView?.layer.shadowRadius = 10
//
//        oView?.layer.cornerRadius = 20
//        oView?.layer.shadowOffset = CGSize(width: 5, height: 5)
//        oView?.layer.shadowOpacity = 0.1
//        oView?.layer.shadowRadius = 10
//
//        aView?.layer.cornerRadius = 20
//        aView?.layer.shadowOffset = CGSize(width: 5, height: 5)
//        aView?.layer.shadowOpacity = 0.1
//        aView?.layer.shadowRadius = 10
//
//        pView?.layer.cornerRadius = 20
//        pView?.layer.shadowOffset = CGSize(width: 5, height: 5)
//        pView?.layer.shadowOpacity = 0.1
//        pView?.layer.shadowRadius = 10
//
//    }
    
    func setupAnimate() {
        let animationView = LottieAnimationView(name: "DotBackgroundAnimate")
        animationView.contentMode = .scaleAspectFill
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        animationView.center = CGPoint(x: UIScreen.main.bounds.size.width * 0.5, y:  UIScreen.main.bounds.size.height * 0.5)
        animationView.loopMode = .loop
        animationView.animationSpeed = 1
        animateBackgroundView!.addSubview(animationView)
        animationView.play()
    }
    
    // MARK: - IBAction
    
    @IBAction func clickBtnMedicalRecords() {
        scvPatientInfo?.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
    @IBAction func clickBtnMedication() {
        scvPatientInfo?.setContentOffset(CGPoint(x: (scvPatientInfo?.frame.width)!, y: 0), animated: true)
    }
    
    @IBAction func clickBtnNotice() {
        scvPatientInfo?.setContentOffset(CGPoint(x: (scvPatientInfo?.frame.width)! * 2, y: 0), animated: true)
    }
    
}

// MARK: - Extension

extension PersonalInformationViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView.tag {
        case 0:
            return SingletonOfPatient.shared.cases.count
        case 1:
            return SingletonOfPatient.shared.medication.count
        default:
            if SingletonOfPatient.shared.notice.first == "none" {
                return 1
            } else {
                return SingletonOfPatient.shared.notice.count
            }
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView.tag {
        case 0:
            let cell = tbvMedical?.dequeueReusableCell(withIdentifier: MedicalTableViewCell.identified, for: indexPath) as! MedicalTableViewCell
            cell.lbTitle.text = SingletonOfPatient.shared.cases[indexPath.row]
            return cell
        case 1:
            let cell = tbvMedication?.dequeueReusableCell(withIdentifier: MedicationTableViewCell.identified, for: indexPath) as! MedicationTableViewCell
            cell.lbTitle.text = SingletonOfPatient.shared.medication[indexPath.row]
            return cell
        default:
            if SingletonOfPatient.shared.notice.first == "none" {
                let cell = tbvNotice?.dequeueReusableCell(withIdentifier: NoticeTableViewCell.identified, for: indexPath) as! NoticeTableViewCell
                cell.lbTitle.text = "無"
                return cell
            } else {
                let cell = tbvNotice?.dequeueReusableCell(withIdentifier: NoticeTableViewCell.identified, for: indexPath) as! NoticeTableViewCell
                cell.lbTitle.text = SingletonOfPatient.shared.notice[indexPath.row]
                return cell
            }
        }
    }
}

extension PersonalInformationViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = scrollView.bounds.width
            let offsetX = scrollView.contentOffset.x
            let currentPage = Int(floor((offsetX - pageWidth / 2) / pageWidth)) + 1
        switch currentPage {
        case 0:
            UIView.animate(withDuration: 0.3) { [self] in
                self.vSelectShadow!.transform = CGAffineTransform(translationX: 0,
                                                                  y: 0)
            }
        case 1:
            UIView.animate(withDuration: 0.3) { [self] in
                self.vSelectShadow!.transform = CGAffineTransform(translationX: (vSelectShadow?.frame.width)!,
                                                                  y: 0)
            }
        default:
            UIView.animate(withDuration: 0.3) { [self] in
                self.vSelectShadow!.transform = CGAffineTransform(translationX: (vSelectShadow?.frame.width)! * 2,
                                                                  y: 0)
            }
        }
    }
}

