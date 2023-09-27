//
//  CommentUseCase.swift
//  ChatGPTExtension
//
//  Created by marco.iniguez.ollero on 22/3/23.
//

import Foundation

protocol CommentUseCase {
    func comment(function code: [String]) async throws -> Suggestion
}
