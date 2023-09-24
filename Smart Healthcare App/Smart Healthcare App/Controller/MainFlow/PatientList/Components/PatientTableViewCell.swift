//
//  PatientTableViewCell.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/9/25.
//

import UIKit

class PatientTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var igvPatient: UIImageView?
    @IBOutlet weak var lbname: UILabel?
    @IBOutlet weak var lbMRN: UILabel?
    @IBOutlet weak var lbWardNum: UILabel?
    @IBOutlet weak var lbBedNum: UILabel?
    
    // MARK: - Variables
    
    static let identified = "PatientTableViewCell"
    
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - UI Settings
    
    
    // MARK: - IBAction
    
}

// MARK: - Extensions



// MARK: - Protocol
