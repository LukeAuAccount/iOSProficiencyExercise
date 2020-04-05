//
//  ViewController.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 5/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
    }
    
    private func configureViewController() {
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        tableView.estimatedRowHeight    = 80
        tableView.rowHeight             = UITableView.automaticDimension
        tableView.tableFooterView       = UIView(frame: .zero)
        
        tableView.delegate              = self
        tableView.dataSource            = self
        
        tableView.register(MainScreenCell.self, forCellReuseIdentifier: MainScreenCell.reuseID)
    }


}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenCell.reuseID, for: indexPath) as! MainScreenCell
        
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
}
