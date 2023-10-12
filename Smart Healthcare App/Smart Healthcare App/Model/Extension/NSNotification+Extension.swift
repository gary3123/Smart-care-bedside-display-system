//
//  NSNotification+Extension.swift
//  Smart care bedside display system
//
//  Created by imac-3570 on 2023/10/3.
//

import Foundation

extension NSNotification.Name {
    
    static let reloadPatientsTableView = Notification.Name("reloadPatientsTableView")
    static let callGetMedicalRecords = Notification.Name("callGetMedicalRecords")
}
