// Created by Gayan Dias on 12/09/2022.

import Foundation

struct LogCategory {
    let name: String
    let prefix: String
}

extension LogCategory {
    static let network = LogCategory(name: "network", prefix: "NW")
    static let payment = LogCategory(name: "payment", prefix: "PAY")
}
