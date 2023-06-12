//
//  Alert.swift
//  Smart Healthcare App
//
//  Created by Gary on 2023/6/8.
//

import UIKit

public class Alert{
    
    static func showAlert(title: String,
                   message: String,
                   vc: UIViewController,
                   confirmTitle: String,
                   cancelTitle: String,
                   confirmAction: (() -> Void)? = nil,
                   cancelAction: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title,
                                          message: message,
                                          preferredStyle: .alert)
            let confirm = UIAlertAction(title: confirmTitle, style: .default) { action in
                confirmAction?()
            }
            let cancel = UIAlertAction(title: cancelTitle, style: .cancel) { action in
                cancelAction?()
            }
            alertController.addAction(confirm)
            alertController.addAction(cancel)
            vc.present(alertController, animated: true)
        }
    }
}
