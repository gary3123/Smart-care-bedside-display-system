//
//  UploadMedicalRecordRequest.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/10/2.
//

import Foundation

public struct UploadMedicalRecordRequest: Encodable {
    public var medicalRecordNumber: String
    public var ms_id: String
    public var medicalRecordID: Int
    public var medication: String
    public var drugClass: Int
    public var time: String
    public var notice: String
}
