//
//  GetMedicalRecords.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/10/2.
//

import Foundation

public struct GetMedicalRecordsRequest: Encodable {
    public var medicalRecordNumber: String
    public var medicalRecordID: Int
    public var date: String
}

public struct GetMedicalRecordsResponse: Decodable {
    public var time: String
    public var drugName: String
    public var drugClass: Int
    public var note: String
    public var id: Int
}

