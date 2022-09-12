// Created by Gayan Dias on 10/09/2022.

import SwiftUI

extension Alert {
    init(with alertMessage: AlertMessage) {
        if let secondaryButton = alertMessage.secondaryButton {
            self.init(
                title: Text(alertMessage.title),
                message: Text(alertMessage.message),
                primaryButton: alertMessage.primaryButton,
                secondaryButton: secondaryButton
            )
        } else {
            self.init(
                title: Text(alertMessage.title),
                message: Text(alertMessage.message),
                dismissButton: alertMessage.primaryButton
            )
        }
    }
}
