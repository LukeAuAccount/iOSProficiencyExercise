//
//  LKError.swift
//  iOSProficiencyExercise
//
//  Created by Liu Changhong on 5/4/20.
//  Copyright © 2020 Liu Changhong. All rights reserved.
//

import Foundation

enum LKError: String, Error {
    case invalidURL         = "Invalid URL. Please try again."
    case invalidResponse    = "Invalid response from the server. Please try again."
    case invalidData        = "The data received from the server was invalid. Please try again."
    case unableToComplete   = "Unable to complete your request. Please check your internet connection."
}
