//
//  UIView+Ext.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 5/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import UIKit

extension UIView {
  
  /// Add  multiple subViews
  /// - Parameter views: Variadic Views
  func addSubViews(_ views: UIView...) {
    for view in views { addSubview(view) }
  }
  
}
