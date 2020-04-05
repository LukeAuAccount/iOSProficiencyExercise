//
//  NetworkManager.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 5/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    private let baseURL = "https://dl.dropboxusercontent.com/"
    
    private init() {}
    
    func getMainScreenData(completed: @escaping (Result<MainScreenViewModel, LKError>) -> Void) {
        
        let endPoint = baseURL + "s/2iodh4vg0eortkl/facts.json"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let _ = error {
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

            guard let jsonStr = String(data: data, encoding: .ascii), let utf8Data = jsonStr.data(using: .utf8) else {
                completed(.failure(.invalidData))
                return
            }
                        
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
