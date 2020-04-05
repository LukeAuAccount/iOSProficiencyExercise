//
//  LKAvatarImageView.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 5/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import UIKit

class LKAvatarImageView: UIImageView {

//    let cache               = NetworkManager.shared.cache
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        layer.cornerRadius  = 10
        clipsToBounds       = true
        backgroundColor     = .systemGray
        translatesAutoresizingMaskIntoConstraints = false
    }
    
//    func downloadImage(fromURL url: String) {
//        NetworkManager.shared.downloadImage(from: url) { [weak self] (image) in
//            guard let self = self else { return }
//            DispatchQueue.main.async { self.image = image }
//        }
//    }

}
