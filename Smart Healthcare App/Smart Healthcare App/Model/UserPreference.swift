//
//  UserPreference.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/11/20.
//

import Foundation

class UserPreferences {
    static let shared = UserPreferences()
    private let userPreferance: UserDefaults
    private init() {
        userPreferance = UserDefaults.standard
    }
    
    enum UserPreference: String {
        case networkPath
    }
    
    var networkPath: String {
        get { return userPreferance.string( forKey: UserPreference.networkPath.rawValue) ?? ""}
        set { return userPreferance.set( newValue, forKey: UserPreference.networkPath.rawValue)}
    }
}
