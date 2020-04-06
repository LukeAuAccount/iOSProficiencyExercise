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
  
  /// request main screen data
  /// - Parameter completed: completed closure
  func performMainScreenGetRequest(completed: @escaping (Result<MainScreenViewModel, LKError>) -> Void) {
    performGetRequest(endPoind: .facts, completed: completed)
  }
  
}

// MARK: - Request Methods
extension NetworkManager {
  
  /// request data
  /// - Parameters:
  ///   - endPoind: endPoint enum
  ///   - completed: completed closure
  private func performGetRequest<T: Decodable>(endPoind: NetworkEndPoint,
                                               completed: @escaping (Result<T, LKError>) -> Void) {
    let endPoint = baseURL + endPoind.rawValue
    
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
        let model = try decoder.decode(T.self, from: utf8Data)
        completed(.success(model))
      } catch {
        print(error)
        completed(.failure(.invalidData))
      }
    }
    
    task.resume()
  }
  
}
