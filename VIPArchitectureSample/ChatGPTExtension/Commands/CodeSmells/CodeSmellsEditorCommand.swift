//
//  CodeSmellsEditorCommand.swift
//  ChatGPTExtension
//
// Created by marco.iniguez.ollero on 5/6/23.
//

import Foundation
import XcodeKit

final class CodeSmellsEditorCommand: NSObject, XCSourceEditorCommand {
    let useCase: CodeSmellsUseCase = DefaultCodeSmellsUseCase()
    
    func perform(with invocation: XCSourceEditorCommandInvocation, completionHandler: @escaping (Error?) -> Void ) -> Void {
        guard let codeLines = invocation.buffer.lines as? [String] else {
            completionHandler(nil)
            return
        }
        
        Task {
            do {
                let suggestion = try await self.useCase.searchForCodeSmells(in: codeLines)
                
                let insertedSuggestion = "/**\(suggestion.result)\n*/"
                
                invocation.buffer.lines.add(insertedSuggestion)
            } catch let error {
                print("🚨 Something goes wrong... \(error)")
            }
            
            completionHandler(nil)
        }
    }
}
