//
//  MainScreenCell.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 5/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import UIKit
import Kingfisher

class MainScreenCell: UITableViewCell {

    static let reuseID      = "MainScreenCellID"
    
    let avatarImageView     = LKAvatarImageView(frame: .zero)
    let titleLabel          = LKTitleLabel(textAlignment: .left, fontSize: 26)
    let descriptionLabel    = LKBodyLabel(fontSize: 16)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(row: Row) {
        titleLabel.text = row.title ?? "No Title"
        descriptionLabel.text = row.description ?? "No Description."
        avatarImageView.kf.setImage(with: URL(string: row.imageHref ?? ""), placeholder: Images.placeholder)
    }
    
    private func configure() {
        configureAvatarImageView()
        configureTitleLabel()
        configureDescriptionLabel()
    }
    
    private func configureAvatarImageView() {
        addSubview(avatarImageView)
        
        avatarImageView.snp.makeConstraints { (make) in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(12)
            make.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(12)
            make.width.height.equalTo(60)
        }
    }
    
    private func configureTitleLabel() {
        addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalTo(avatarImageView.snp.top)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(12)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-12)
            make.height.equalTo(30)
        }
    }
    
    private func configureDescriptionLabel() {
        addSubview(descriptionLabel)
        
        descriptionLabel.numberOfLines = 0
        descriptionLabel.sizeToFit()
        
        descriptionLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(12)
            make.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-12)
            make.bottom.equalTo(-12)
        }
    }

}
