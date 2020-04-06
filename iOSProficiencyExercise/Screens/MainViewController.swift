//
//  ViewController.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 5/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import UIKit

class MainViewController: LKDataLoadingVC {
  
  var mainScrViewModel = MainScreenViewModel(title: "", rows: [])
  
  let tableView = UITableView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    configureViewController()
    configureTableView()
    // Network Request and update UI
    refreshData()
  }
  
  func configureViewController() {
    view.backgroundColor = .white
    navigationController?.navigationBar.prefersLargeTitles = true
    // add refresh button
    let refreshButton = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshData))
    navigationItem.rightBarButtonItem = refreshButton
  }
  
  func configureTableView() {
    view.addSubview(tableView)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    
    tableView.snp.makeConstraints { (make) in
      make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
      make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
      make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
      make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
    }
    
    // auto height
    tableView.estimatedRowHeight    = 80
    tableView.rowHeight             = UITableView.automaticDimension
    
    tableView.tableFooterView       = UIView(frame: .zero)
    
    tableView.delegate              = self
    tableView.dataSource            = self
    
    tableView.register(MainScreenCell.self, forCellReuseIdentifier: MainScreenCell.reuseID)
  }
  
}

// MARK: - Get Data
extension MainViewController {
  
  /// check network status and request data
  @objc func refreshData() {
    if getNetworkReachable() {
      requestData()
    } else {
      presentLKAlertOnMainThread(title: "Network Offline",
                                 message: "Please check your network status...",
                                 buttonTitle: "Ok")
    }
  }
  
  /// request data
  private func requestData() {
    showLoadingView()
    NetworkManager.shared.performMainScreenGetRequest { [weak self] (result) in
      guard let self = self else { return }
      self.dismissLoadingView()
      switch result {
      case .success(let mainScrViewModel):
        self.mainScrViewModel = mainScrViewModel
        self.updateUI()
      case .failure(let error):
        print(error.rawValue)
        self.presentLKAlertOnMainThread(title: "Something Went Wrong", message: error.rawValue, buttonTitle: "Ok")
      }
    }
  }
  
  /// update UI, including nav.title and tableView
  private func updateUI() {
    DispatchQueue.main.async {
      self.title = self.mainScrViewModel.title
      self.tableView.reloadData()
    }
  }
  
}

// MARK: - UITableView DataSource
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

// MARK: - UITableView Delegate
extension MainViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
  }
  
}
