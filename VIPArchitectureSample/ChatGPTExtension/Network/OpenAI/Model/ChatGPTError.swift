//
//  ChatGPTError.swift
//  ChatGPTExtension
//
// Created by marco.iniguez.ollero on 5/6/23.
//

import Foundation

enum ChatGPTError: Error {
    case malformedURL(value: String)
    case authentication
    case rateLimitReached
    case serverError
    case unknownServerResponse
    case malformedResponse
}
