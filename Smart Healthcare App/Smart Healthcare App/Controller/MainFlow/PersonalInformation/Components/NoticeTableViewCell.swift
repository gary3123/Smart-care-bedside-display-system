//
//  NoticeTableViewCell.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/10/2.
//

import UIKit

class NoticeTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var lbTitle: UILabel!
    
    // MARK: - Variables
    
    static let identified = "NoticeTableViewCell"
    
    
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
