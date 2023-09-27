//
//  RegexUseCase.swift
//  ChatGPTExtension
//
//  Created by marco.iniguez.ollero on 20/3/23.
//

import Foundation

protocol RegexUseCase {
    func generateRegexFor(string value: String) async throws -> Suggestion
}
