//
//  DefaultRegexUseCase.swift
//  ChatGPTExtension
//
//  Created by marco.iniguez.ollero on 20/3/23.
//

import Foundation

final class DefaultRegexUseCase: RegexUseCase {
    private let repository = ChatGPTRegexRepository()
    
    func generateRegexFor(string value: String) async throws -> Suggestion {
        let suggestions = try await self.repository.generateRegexFor(string: value)
        
        guard let suggestion = suggestions.first else {
            throw ConverterError.emptyResults
        }
        
        return suggestion
    }
}
