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
    @IBOutlet weak var sView: UIView?
    @IBOutlet weak var oView: UIView?
    @IBOutlet weak var aView: UIView?
    @IBOutlet weak var pView: UIView?
    @IBOutlet weak var animateBackgroundView: UIView?
   
    
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
        setupSOAPView()
        setupAnimate()
    }
    
    func setuppersonalBackgroundView() {
        personalBackgroundView?.layer.cornerRadius = 20
        personalBackgroundView?.layer.shadowOffset = CGSize(width: 0, height: 0)
        personalBackgroundView?.layer.shadowOpacity = 0.3
        personalBackgroundView?.layer.shadowRadius = 20
        personalBackgroundView?.layer.shadowColor = UIColor.tintColor.cgColor
    }
    
    func setupSOAPView() {
        sView?.layer.cornerRadius = 20
        sView?.layer.shadowOffset = CGSize(width: 5, height: 5)
        sView?.layer.shadowOpacity = 0.1
        sView?.layer.shadowRadius = 10
        
        oView?.layer.cornerRadius = 20
        oView?.layer.shadowOffset = CGSize(width: 5, height: 5)
        oView?.layer.shadowOpacity = 0.1
        oView?.layer.shadowRadius = 10
        
        aView?.layer.cornerRadius = 20
        aView?.layer.shadowOffset = CGSize(width: 5, height: 5)
        aView?.layer.shadowOpacity = 0.1
        aView?.layer.shadowRadius = 10
        
        pView?.layer.cornerRadius = 20
        pView?.layer.shadowOffset = CGSize(width: 5, height: 5)
        pView?.layer.shadowOpacity = 0.1
        pView?.layer.shadowRadius = 10
        
    }
    
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
    
    
}

// MARK: - Extension

