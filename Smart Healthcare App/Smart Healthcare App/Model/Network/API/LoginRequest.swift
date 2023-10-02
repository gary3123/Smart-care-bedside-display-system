//
//  LoginRequest.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/10/2.
//

import Foundation

public struct LoginRequest: Encodable {
    public var account: String
    public var password: String
}


