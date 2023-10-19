//
//  APIClientMock.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 2/10/23.
//  Copyright © 2023 Accenture. All rights reserved.
//

import Foundation

final class APIClientMock: APIClientProtocol {
    var apiError: CustomNetworkError?
    var mockErrorResponse: String?

    init(apiError: CustomNetworkError? = nil, mockErrorResponse: String? = nil) {
        self.apiError = apiError
        self.mockErrorResponse = mockErrorResponse
    }

    func performRequest<T>(endpoint: APIEndpoint, responseModel: T.Type) async throws -> T where T : Decodable {
        var mockNamePath = endpoint.mockName
        if let errorResponse = mockErrorResponse {
            mockNamePath = errorResponse
        }
        if let data = FileManager.default.contents(atPath: mockNamePath) {
            if  let error = apiError {
                throw error
            }
            let decoder = JSONDecoder()
            do {
                let model = try decoder.decode(responseModel.self, from: data)
                return model
            } catch {
                fatalError(error.localizedDescription)
            }
        }
        throw CustomNetworkError.serverError
    }
}
