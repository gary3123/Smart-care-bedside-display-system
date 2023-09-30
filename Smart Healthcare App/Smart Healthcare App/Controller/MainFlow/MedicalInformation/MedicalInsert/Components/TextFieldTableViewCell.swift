//
//  TextFieldTableViewCell.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/9/30.
//

import UIKit
import RVS_AutofillTextField

class TextFieldTableViewCell: UITableViewCell {
    
    // MARK: - IBOutlet
    @IBOutlet weak var txfMedicalName: RVS_AutofillTextField!
    
    // MARK: - Variables
    
    static let identified = "TextFieldTableViewCell"
    let drugNames = [
        "SILICEA",
        "Naproxen",
        "Moisturizing Antibacterial",
        "Quick Action",
        "Cuprum aceticum Nicotiana",
        "Mekinist",
        "Glimepiride",
        "Methocarbamol",
        "anti itch",
        "NP Thyroid 120",
        "ChloraPrep One-Step",
        "Rescue Sleep",
        "Pain Reliever Extra Strength",
        "Tussin CF Non Drowsy Multi Symptom"
    ]
    
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txfMedicalName.dataSource = self
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - UI Settings
    
    
    // MARK: - IBAction
    
}

// MARK: - Extensions

//extension TextFieldTableViewCell: AutocompleteDelegate {
//
//    func autoCompleteTextField() -> UITextField {
//        return txfMedicalName
//    }
//
//    func autoCompleteThreshold(_ textField: UITextField) -> Int {
//        return 1
//    }
//
//    func autoCompleteItemsForSearchTerm(_ term: String) -> [CCAutocomplete.AutocompletableOption] {
//        let ans: AutocompletableOption
//        let ansa: [AutocompletableOption]
//        let drugNames = [
//            "SILICEA",
//            "Naproxen",
//            "Moisturizing Antibacterial",
//            "Quick Action",
//            "Cuprum aceticum Nicotiana",
//            "Mekinist",
//            "Glimepiride",
//            "Methocarbamol",
//            "anti itch",
//            "NP Thyroid 120",
//            "ChloraPrep One-Step",
//            "Rescue Sleep",
//            "Pain Reliever Extra Strength",
//            "Tussin CF Non Drowsy Multi Symptom"
//        ]
////        for i in 0 ..< drugNames.count {
////            ans.id = i
////            ans.text = drugNames[]
////        }
//    }
//
//    func autoCompleteHeight() -> CGFloat {
//        return 250
//    }
//
//    func didSelectItem(_ item: CCAutocomplete.AutocompletableOption) {
//        <#code#>
//    }
//
//
//}

extension TextFieldTableViewCell: RVS_AutofillTextFieldDataSource {
    var textDictionary: [RVS_AutofillTextFieldDataSourceType] {
        drugNames.compactMap {
            let currentStr = $0.trimmingCharacters(in: .whitespacesAndNewlines)
            return !currentStr.isEmpty ? RVS_AutofillTextFieldDataSourceType(value: currentStr) : nil
        }
    }
}

//extension TextFieldTableViewCell: RVS_AutofillTextFieldDelegate {
//    func text
//}

// MARK: - Protocol
