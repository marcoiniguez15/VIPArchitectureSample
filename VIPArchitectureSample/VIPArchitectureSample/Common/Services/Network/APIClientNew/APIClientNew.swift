//

import Foundation
import Alamofire

protocol APIClientNewProtocol {
    func sendRequest<T: Decodable>(endpoint: APIEndpoint, responseModel: T.Type) async throws -> T

    func performRequest<T: Decodable>(endpoint: APIEndpoint, responseModel: T.Type) async throws -> T
}

final class APIClientNew: APIClientNewProtocol {
    private static var instance: APIClientNew?
    static var shared: APIClientNew {
      if let instance = self.instance {
        return instance
      } else {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = HTTPHeaders.default.dictionary
        configuration.timeoutIntervalForRequest = 30
        let manager = Session(configuration: configuration)
        instance = APIClientNew(manager: manager)
        return instance!
      }
    }
    let manager: Session
    private init(manager: Session) {
      self.manager = manager
    }

    func sendRequest<T: Decodable>(
        endpoint: APIEndpoint,
        responseModel: T.Type
    ) async throws -> T {

        let urlString = endpoint.scheme + endpoint.basePath + endpoint.path

        guard let url = URL(string: urlString) else {
            throw CustomNetworkError.unsuppotedURL
        }
        var request = URLRequest(url: url)
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.header

        if let body = endpoint.body {
            switch endpoint.contentType {
            case .json:
                // Parameters
                do {
                    request.httpBody = try getBodyJSONParams(parameters: body)
                } catch {
                    throw CustomNetworkError.decode
                }

            case .formUrlEncoded:
                // Parameters
                request.httpBody = getBodyFormUrlEncodedParams(parameters: body)

            case .multipart:
                // Parameters
                break
            }
        }

        do {
            let (data, response) = try await URLSession.shared.data(for: request, delegate: nil)
            guard let response = response as? HTTPURLResponse else {
                throw CustomNetworkError.invalidResponse
            }
            switch response.statusCode {
            case 200...299:
                guard let decodedResponse = try? JSONDecoder().decode(responseModel, from: data) else {
                    throw CustomNetworkError.decode
                }
                return decodedResponse
            case 401:
                throw CustomNetworkError.unauthorized
            default:
                throw CustomNetworkError.serverError
            }
        } catch {
            throw CustomNetworkError.serverUnavailable
        }
    }


    func performRequest<T: Decodable>(endpoint: APIEndpoint, responseModel: T.Type) async throws -> T {
        return try await withCheckedThrowingContinuation { continuation in
            var header:[HTTPHeader] = []
            if let endPointHeader = endpoint.header {
                header =  endPointHeader.compactMap { item -> HTTPHeader in
                    return HTTPHeader(name: item.key, value: item.value)
                }
            }
            AF.request(
                endpoint.scheme + endpoint.basePath + endpoint.path,
                method: HTTPMethod(rawValue: endpoint.method.rawValue),
                parameters: endpoint.body,
                headers: HTTPHeaders(header),
                requestModifier: { $0.timeoutInterval = 30 }
            )
            .validate(statusCode: 200..<300)
            .responseDecodable(of: responseModel.self) { response in
                print("🔵🔵🔵")
                debugPrint(response)
                print("🔵🔵🔵")
                switch(response.result) {
                case let .success(data):
                    continuation.resume(returning: data)
                case .failure(_):
                    if response.response?.statusCode == 401 {
                        continuation.resume(throwing: CustomNetworkError.unauthorized)
                    } else {
                        continuation.resume(throwing: CustomNetworkError.serverError)
                    }
                }

            }
        }

    }
}

private extension APIClientNew {
    func getBodyJSONParams(parameters: [String: String]) throws -> Data? {
        do {
            return try JSONSerialization.data(withJSONObject: parameters, options: [])
        } catch {
            throw CustomNetworkError.decode
        }
    }

    func getBodyFormUrlEncodedParams(parameters: [String: String]) -> Data? {
        guard let postData = parameters.queryString.data(using: .utf8)
        else { return nil }
        return postData
    }
}
