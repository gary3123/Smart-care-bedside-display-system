//
//  PatientInfoRequest.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/10/2.
//

import Foundation

public struct PatientInfoRequest: Encodable {
    public var medicalRecordNumber: String
    public var medicalRecordId: Int
}

public struct PatientInfoResponse: Decodable {
    public var name: String
    public var gender: Int
    public var medicalRecordNumber: String
    public var wardNumber: String
    public var birthday: String
    public var bedNumber: Int
    public var medication: [String]
    public var notice: [String]
    public var cases: [String]
}
