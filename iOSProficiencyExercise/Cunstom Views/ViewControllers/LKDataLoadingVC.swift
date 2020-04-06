//
//  LKDataLoadingVC.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 6/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import UIKit

class LKDataLoadingVC: UIViewController {
    
    var containerView: UIView!
    
    func showLoadingView() {
        containerView = UIView(frame: view.bounds)
        view.addSubview(containerView)
        
        containerView.backgroundColor   = .lightGray
        containerView.alpha             = 0
        
        UIView.animate(withDuration: 0.25) { self.containerView.alpha = 0.8 }
        
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        containerView.addSubview(activityIndicator)
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        activityIndicator.snp.makeConstraints { (make) in
            make.centerY.equalTo(containerView.snp.centerY)
            make.centerX.equalTo(containerView.snp.centerX)
        }
        
        activityIndicator.startAnimating()
    }
    
    func dismissLoadingView() {
        DispatchQueue.main.async {
            self.containerView.removeFromSuperview()
            self.containerView = nil
        }
    }

}
