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
    @IBOutlet weak var scvPatientInfo: UIScrollView?
    @IBOutlet weak var btnMedicalRecords: UIButton?
    @IBOutlet weak var btnMedication: UIButton?
    @IBOutlet weak var btnNotice: UIButton?
    @IBOutlet weak var vSelectShadow: UIView?
//    @IBOutlet weak var vMedicalRecords: UIView?
//    @IBOutlet weak var vMedication: UIView?
//    @IBOutlet weak var vNotice: UIView?
   
    
    // MARK: - Variables
    
    
    // MARK: - LifeCycle
   
    
    override func viewWillAppear(_ animated: Bool) {
        print("PersonalInformationViewController")
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
        tbvMedical?.dataSource = self
        tbvMedical?.delegate = self
    
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tbvMedical?.dequeueReusableCell(withIdentifier: MedicalTableViewCell.identified, for: indexPath) as! MedicalTableViewCell
        return cell
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

