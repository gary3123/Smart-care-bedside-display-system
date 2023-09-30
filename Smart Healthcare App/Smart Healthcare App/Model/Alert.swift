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

    static func showActionSheet(array: [String],
                                canceltitle: String,
                                vc: UIViewController,
                                confirm: ((Int) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: nil,
                                                    message: nil,
                                                    preferredStyle: .actionSheet)
            
            for option in array {
                let action = UIAlertAction(title: option, style: .default) { action in
                    let index = array.firstIndex(of: option)
                    confirm?(index!)
                }
                action.setValue(UIColor.ThemeColor!, forKey: "titleTextColor")
                alertController.addAction(action)
            }
            let cancelAction = UIAlertAction(title: canceltitle, style: .cancel)
            cancelAction.setValue(UIColor.ThemeColor!, forKey: "titleTextColor")
            alertController.addAction(cancelAction)
            vc.present(alertController,animated: true)
        }
    }
}
