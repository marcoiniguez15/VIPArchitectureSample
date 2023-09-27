//
//  CodeSmellsUseCase.swift
//  ChatGPTExtension
//
// Created by marco.iniguez.ollero on 5/6/23.
//

import Foundation

protocol CodeSmellsUseCase {
    func searchForCodeSmells(in code: [String]) async throws -> Suggestion
}
