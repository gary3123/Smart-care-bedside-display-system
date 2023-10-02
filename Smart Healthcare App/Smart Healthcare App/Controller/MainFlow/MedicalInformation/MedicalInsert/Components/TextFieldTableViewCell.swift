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
    var drugNames: [String] = []
    var result: [Medications]? = nil
    
    struct Medications: Decodable {
        public var name: String
        public var drug_class: Int
    }
    
    // MARK: - LifeCycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        txfMedicalName.dataSource = self
        loadJson(filename: "Medication")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func loadJson(filename fileName: String) {
        drugNames = []
        if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                let jsonData: [Medications] = try decoder.decode([Medications].self, from: data)
                
                jsonData.forEach { medication in
                    drugNames.append(medication.name)
                }
            } catch {
                print("error:\(error)")
            }
        }
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
