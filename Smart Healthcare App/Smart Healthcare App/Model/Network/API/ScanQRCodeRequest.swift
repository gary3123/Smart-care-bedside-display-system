//
//  ScanQRCodeRequest.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/10/3.
//

import Foundation

public struct ScanQRCodeRequest: Encodable {
    public var medicalRecordNumber: String
    public var medicalRecordID: Int
}

public struct ScanQRCodeResponse: Decodable {
    public var name: String
    public var medicalRecordNumber: String
    public var medicalRecordID: Int
    public var wardNumber: String
    public var bedNumber: Int
}
