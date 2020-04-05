//
//  ViewController.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 5/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    var mainScrViewModel = MainScreenViewModel(title: "", rows: [])
    
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewController()
        configureTableView()
        
        NetworkManager.shared.getMainScreenData { [weak self] (result) in
            guard let self = self else { return }
            
            switch result {
            case .success(let mainScrViewModel):
                self.mainScrViewModel = mainScrViewModel
                self.updateUI()
            case .failure(let error):
                print(error.rawValue)
            }
        }
        
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

    private func updateUI() {
        DispatchQueue.main.async {
            self.title = self.mainScrViewModel.title
            self.tableView.reloadData()
        }
    }

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainScrViewModel.rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainScreenCell.reuseID, for: indexPath) as! MainScreenCell
        cell.set(row: mainScrViewModel.rows[indexPath.row])
        return cell
    }
    
}

extension MainViewController: UITableViewDelegate {
    
}
