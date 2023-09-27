//
//  DefaultCommentUseCase.swift
//  ChatGPTExtension
//
//  Created by marco.iniguez.ollero on 22/3/23.
//

import Foundation

final class DefaultCommentUseCase: CommentUseCase {
    private let repository = ChatGPTCommentRepository()
    
    func comment(function code: [String]) async throws -> Suggestion {
        let preparedCode = code.reduce("") { $0 + $1 }
        
        let suggestions = try await self.repository.comment(function: preparedCode)
        
        guard let suggestion = suggestions.first else {
            throw ConverterError.emptyResults
        }
        
        return suggestion
    }
}
