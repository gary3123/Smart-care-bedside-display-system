//
//  TextViewTableViewCell.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/9/30.
//

import UIKit

class TextViewTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var txvNote: UITextView!
    
    // MARK: - Variables
    
    static let identified = "TextViewTableViewCell"
    
    
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
