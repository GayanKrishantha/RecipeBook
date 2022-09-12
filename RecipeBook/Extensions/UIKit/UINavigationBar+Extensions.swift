// Created by Gayan Dias on 10/09/2022.

import UIKit

extension UINavigationBar {
    enum Style {
        case opaque(backgroundColor: UIColor, tintColor: UIColor)
        case transparent(tintColor: UIColor)

        static var opaque: Style {
            .opaque(tintColor: .neutral30)
        }

        static func opaque(tintColor: UIColor) -> Style {
            .opaque(backgroundColor: .neutral10, tintColor: tintColor)
        }

        static var transparent: Style {
            .transparent(tintColor: .neutral00)
        }

        var tintColor: UIColor {
            switch self {
            case let .opaque(_, tintColor), let .transparent(tintColor):
                return tintColor
            }
        }
    }

    func apply(style: Style) {
        let appearance: UINavigationBarAppearance
        switch style {
        case let .opaque(backgroundColor, tintColor):
            appearance = .opaque(backgroundColor: backgroundColor, tintColor: tintColor)
        case let .transparent(tintColor):
            appearance = .transparent(tintColor: tintColor)
        }

        tintColor = style.tintColor
        standardAppearance = appearance
        compactAppearance = appearance
        scrollEdgeAppearance = appearance
        if #available(iOS 15.0, *) {
            compactScrollEdgeAppearance = appearance
        }
    }
}
