import Foundation
import Alamofire

protocol APIEndpoint {
    var scheme: String { get }
    var basePath: String { get }
    var path: String { get }
    var contentType: ContentType { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
    var mockName: String { get }
}

extension APIEndpoint {
    var scheme: String {
        return "https://"
    }
}

