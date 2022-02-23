//
//  Dictionary+Additions.swift
//  VIPArchitectureSample
//
//  Created by marco.iniguez.ollero on 23/2/22.
//

import Foundation
extension Dictionary {
    var queryString: String {
        var output: String = ""
        forEach({ output += "\($0.key)=\($0.value)&" })
        output = String(output.dropLast())
        return output
    }
}
