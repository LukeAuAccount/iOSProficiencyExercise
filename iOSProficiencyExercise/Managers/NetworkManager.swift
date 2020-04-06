//
//  NetworkManager.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 5/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import Foundation

class NetworkManager {
  
  /// Singleton
  static let shared = NetworkManager()
  private init() {}
  
  /// base URL
  private let baseURL = "https://dl.dropboxusercontent.com/"
  
  /// request data on Main Screen
  /// - Parameter completed: completed closure
  func getMainScreenData(completed: @escaping (Result<MainScreenViewModel, LKError>) -> Void) {
    let endPoint = baseURL + "s/2iodh4vg0eortkl/facts.json"
    
    // request url
    guard let url = URL(string: endPoint) else {
      completed(.failure(.invalidURL))
      return
    }
    
    // request task
    let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
      if error != nil {
        completed(.failure(.unableToComplete))
        return
      }
      
      guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
        completed(.failure(.invalidResponse))
        return
      }
      
      guard let data = data else {
        completed(.failure(.invalidData))
        return
      }
      
      // convert ascii data to utf-8 data
      guard let jsonStr = String(data: data, encoding: .ascii), let utf8Data = jsonStr.data(using: .utf8) else {
        completed(.failure(.invalidData))
        return
      }
      
      // decoding json
      do {
        let decoder = JSONDecoder()
        let mainScrViewModel = try decoder.decode(MainScreenViewModel.self, from: utf8Data)
        completed(.success(mainScrViewModel))
      } catch {
        print(error)
        completed(.failure(.invalidData))
      }
    }
    
    task.resume()
  }
  
}
