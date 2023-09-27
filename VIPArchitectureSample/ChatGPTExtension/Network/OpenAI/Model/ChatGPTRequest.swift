//
//  ChatGPTRequest.swift
//  ChatGPTExtension
//
// Created by marco.iniguez.ollero on 5/6/23.
//

import Foundation

struct ChatGPTRequest: Encodable {
    let model = Constants.modelChatpGPT
    let messages: [ChatGPTRequest.Message]
    
    init(prompt: String) {
        let message = ChatGPTRequest.Message(content: prompt)
        
        self.messages = [
            message
        ]
    }
}

extension ChatGPTRequest {
    struct Message: Encodable {
        let role = Constants.modelChatGPTUser
        let content: String
    }
}
