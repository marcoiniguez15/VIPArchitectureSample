//
//  AnalyzeUseCase.swift
//  ChatGPTExtension
//
// Created by marco.iniguez.ollero on 5/6/23.
//

import Foundation

protocol JSONConverterUseCase {
    func analyze(source code: [String]) async throws -> Suggestion
}
