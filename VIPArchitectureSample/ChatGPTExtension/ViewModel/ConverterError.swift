//
//  ConverterError.swift
//  ChatGPTExtension
//
// Created by marco.iniguez.ollero on 5/6/23.
//

import Foundation

enum ConverterError: Error {
    case emptyResults
    case authorization
    case rateLimit
    case serverStatus
    case unknownResponse
}
