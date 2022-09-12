// Created by Gayan Dias on 10/09/2022.

import UIKit

final class AppNavigationController: UINavigationController {
    override var childForStatusBarStyle: UIViewController? {
        topViewController
    }

    override var childForStatusBarHidden: UIViewController? {
        topViewController
    }

    convenience init() {
        self.init(style: .opaque)
    }

    init(style: UINavigationBar.Style) {
        super.init(nibName: nil, bundle: nil)

        navigationBar.apply(style: style)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
