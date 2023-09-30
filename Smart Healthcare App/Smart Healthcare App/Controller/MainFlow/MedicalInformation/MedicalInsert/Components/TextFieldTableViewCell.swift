//
//  TextFieldTableViewCell.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/9/30.
//

import UIKit

class TextFieldTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var txfMedicalName: UITextField!
    
    // MARK: - Variables
    
    static let identified = "TextFieldTableViewCell"
    
    
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
