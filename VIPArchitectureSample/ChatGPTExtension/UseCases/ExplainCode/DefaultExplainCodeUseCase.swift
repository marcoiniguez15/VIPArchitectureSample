//
//  DefaultExplainCodeUseCase.swift
//  ChatGPTExtension
//
//  Created by marco.iniguez.ollero on 5/3/23.
//

import Foundation

final class DefaultExplainCodeUseCase: ExplainCodeUseCase {
    private let repository = ChatGPTExplainCodeRepository()
    
    func explainMeThis(code: String) async throws -> Suggestion {
        let suggestions = try await self.repository.explainMeThis(code: code)
        
        guard let suggestion = suggestions.first else {
            throw ConverterError.emptyResults
        }
        
        return suggestion
    }
}
