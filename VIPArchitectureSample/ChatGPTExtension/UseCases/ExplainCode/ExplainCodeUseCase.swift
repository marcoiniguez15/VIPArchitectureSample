//
//  ExplainCodeUseCase.swift
//  ChatGPTExtension
//
//  Created by marco.iniguez.ollero on 5/3/23.
//

import Foundation

protocol ExplainCodeUseCase {
    func explainMeThis(code: String) async throws -> Suggestion
}
