//
//  LKAlertContainerView.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 6/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import UIKit

class LKAlertContainerView: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    configure()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configure() {
    backgroundColor       = .lightGray
    layer.cornerRadius    = 16
    layer.borderWidth     = 2
    layer.borderColor     = UIColor.white.cgColor
    translatesAutoresizingMaskIntoConstraints = false
  }
  
}
