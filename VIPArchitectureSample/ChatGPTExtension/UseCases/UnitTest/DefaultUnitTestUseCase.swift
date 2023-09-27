//
//  DefaultUnitTestUseCase.swift
//  ChatGPTExtension
//
//  Created by marco.iniguez.ollero on 19/3/23.
//

import Foundation

final class DefaultUnitTestUseCase: UnitTestUseCase {
    private let repository = ChatGPTUnitTestRepository()
    
    func generateTestsFor(source code: [String]) async throws -> Suggestion {
        let lines = code.reduce("") { $0 + $1 }
        
        let suggestions = try await self.repository.generateTestsFor(source: lines)
        
        guard let suggestion = suggestions.first else {
            throw ConverterError.emptyResults
        }
        
        return suggestion
    }
}
