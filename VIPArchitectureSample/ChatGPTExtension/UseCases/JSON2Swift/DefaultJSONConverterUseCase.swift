//
//  DefaultAnalyzeUseCase.swift
//  ChatGPTExtension
//
// Created by marco.iniguez.ollero on 5/6/23.
//

import Foundation

final class DefaultJSONConverterUseCase: JSONConverterUseCase {
    let repository = ChatGPTJSONConverterRepository()
    
    func analyze(source code: [String]) async throws -> Suggestion {
        let preparedCode = code.reduce("") { $0 + $1 }
        
        let suggestions = try await self.repository.analyze(code: preparedCode)
        
        guard let suggestion = suggestions.first else {
            throw ConverterError.emptyResults
        }
        
        return suggestion
    }
}
