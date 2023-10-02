//
//  PatientsRealmModel.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/10/3.
//

import Foundation
import RealmSwift

class PatientsRealmModel: Object {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var medicalRecordID: Int
    @Persisted var name: String
    @Persisted var medicalRecordNumber: String
    @Persisted var wardNumber: String
    @Persisted var bedNumber: Int
    
    convenience init(medicalRecordID: Int,
                     name: String,
                     medicalRecordNumber: String,
                     wardNumber: String,
                     bedNumber: Int) {
        self.init()
        self.medicalRecordID = medicalRecordID
        self.name = name
        self.medicalRecordNumber = medicalRecordNumber
        self.wardNumber = wardNumber
        self.bedNumber = bedNumber
    }
}

public struct PatientsStruct {
    var id: ObjectId
    var medicalRecordID: Int
    var name: String
    var medicalRecordNumber: String
    var wardNumber: String
    var bedNumber: Int
}
