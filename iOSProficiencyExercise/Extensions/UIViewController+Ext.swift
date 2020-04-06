//
//  UIViewController+Ext.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 6/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func presentLKAlertOnMainThread(title: String, message: String, buttonTitle: String) {
        DispatchQueue.main.async {
            let alertVC = LKAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle  = .overFullScreen
            alertVC.modalTransitionStyle    = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
}
