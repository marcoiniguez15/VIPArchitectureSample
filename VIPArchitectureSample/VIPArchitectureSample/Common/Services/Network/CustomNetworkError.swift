//
//  CustomNetworkError.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//

import Foundation
enum CustomNetworkError: Error {
  case unknownError
  case connectionError
  case invalidCredentials
  case invalidRequest
  case notFound
  case invalidResponse
  case serverError
  case serverUnavailable
  case timeOut
  case unsuppotedURL
}
