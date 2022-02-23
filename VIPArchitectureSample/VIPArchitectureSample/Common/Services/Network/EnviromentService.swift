//
//  EnviromentService.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//

import Foundation

enum EnvironmentService {
  enum Keys {
    case URL(URLKeys)

    var rawValue: String {
      switch self {        
      case let .URL(key):
        return key.rawValue
      }
    }
  }

  enum URLKeys: String {
    case baseURLLastFM = "BASE_URL_LASTFM"
    case baseURLRickMorty = "BASE_URL_RICK_MORTY"
    case apiKeyLASTFM = "API_KEY_LASTFM"
    case baseURLMarvel = "BASE_URL_MARVEL"
    case privateKeyMarvel = "PRIVATE_KEY_MARVEL"
    case publicKeyMarvel = "PUBLIC_KEY_MARVEL"
  }

  static func getValue(for key: Keys) -> String {
    infoForKey(key.rawValue)!
  }
}

private extension EnvironmentService {

  static func infoForKey(_ key: String) -> String? {
    return (Bundle.main.infoDictionary?[key] as? String)?
      .replacingOccurrences(of: "\\", with: "")
  }
}
