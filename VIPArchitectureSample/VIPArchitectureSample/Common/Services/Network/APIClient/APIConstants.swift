//
//  APIConstants.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.

import Foundation

enum RequestMethod: String {
    case delete = "DELETE"
    case get = "GET"
    case patch = "PATCH"
    case post = "POST"
    case put = "PUT"
}

enum APIParameterKey: String {
  case timestamp = "ts"
  case hash = "hash"
  case apiKey = "apikey"
  case limit = "limit"
  case page = "page"
  case offset = "offset"

}
enum HTTPHeaderField: String {
    case authentication = "Authorization"
    case contentType = "Content-Type"
    case acceptType = "Accept"
    case acceptEncoding = "Accept-Encoding"
    case connection = "Connection"
}

enum ContentType: String {
    case json = "application/json"
    case formUrlEncoded = "application/x-www-form-urlencoded"
    case multipart = "multipart/form-data"
}
enum HeadersParams: String {
  case defaultAccept = "*/*"
  case keepAlive = "keep-alive"
  case gzipDeflateBr = "gzip, deflate, br"
}
enum TimeRenewToken: Int {
    case accessTokenPreemptiveRenewTimeInterval = 50
}
