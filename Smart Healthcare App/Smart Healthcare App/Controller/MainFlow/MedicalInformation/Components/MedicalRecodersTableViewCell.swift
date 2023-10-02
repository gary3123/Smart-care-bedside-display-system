//
//  MedicalRecodersTableViewCell.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/10/2.
//

import UIKit

class MedicalRecodersTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    
    @IBOutlet weak var lbTime: UILabel!
    @IBOutlet weak var lbDrugName: UILabel!
    @IBOutlet weak var lbDrugClass: UILabel!
    @IBOutlet weak var txvNote: UITextView!
    
    // MARK: - Variables
    
    static let identified = "MedicalRecodersTableViewCell"
    
    
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
