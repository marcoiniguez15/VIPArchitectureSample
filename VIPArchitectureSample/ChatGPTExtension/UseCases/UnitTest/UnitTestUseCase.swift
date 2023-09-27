//
//  UnitTestUseCase.swift
//  ChatGPTExtension
//
//  Created by marco.iniguez.ollero on 19/3/23.
//

import Foundation

protocol UnitTestUseCase {
    func generateTestsFor(source code: [String]) async throws -> Suggestion
}
