// Created by Gayan Dias on 11/09/2022.

import Foundation

extension AlertMessage {
    init(networkError: NetworkError) {
        switch networkError {
        default:
            self.init(
                title: L10n.Error.common,
                message: L10n.Error.somethingWrong
            )
        }
    }
}
