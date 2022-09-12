// Created by Gayan Dias on 10/09/2022.

import SwiftUI
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo _: UISceneSession, options _: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            window = setupKeyWindow(in: windowScene)
        }
    }

    func setupKeyWindow(in scene: UIWindowScene) -> UIWindow {
        let dependencyContainer = DependencyContainer()
        let navigationController = AppNavigationController(style: .opaque)

        let window = UIWindow(windowScene: scene)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

        let coordinator = AppCoordinatorImpl(
            dependencyContainer: dependencyContainer,
            navigationController: navigationController
        )
        coordinator.start()

        return window
    }
}
