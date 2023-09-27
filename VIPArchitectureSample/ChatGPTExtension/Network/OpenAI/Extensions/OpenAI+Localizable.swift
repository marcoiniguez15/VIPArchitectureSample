//
//  OpenAI+Localizable.swift
//  ChatGPTExtension
//
// Created by marco.iniguez.ollero on 5/6/23.
//

import Foundation

extension OpenAI {
    func localizedPrompt(_ key: String) -> String {
        let openAIBundle = Bundle(for: Self.self)
        
        return NSLocalizedString(key, bundle: openAIBundle, comment: "")
    }
}
