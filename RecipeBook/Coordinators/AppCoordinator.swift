// Created by Gayan Dias on 11/09/2022.

import Foundation
import UIKit

protocol AppCoordinator: AnyObject {
    func start()
}

final class AppCoordinatorImpl: AppCoordinator {
    private let dependencyContainer: DependencyContainer
    private unowned let navigationController: AppNavigationController

    init(dependencyContainer: DependencyContainer,
         navigationController: AppNavigationController) {
        self.dependencyContainer = dependencyContainer
        self.navigationController = navigationController
    }

    func start() {
        let coordinator = RecipeBookCordinatorImpl(navigationController: navigationController)
        let viewModel = RecipeBookListViewModel(
            recipeBookRepository: dependencyContainer.recipeRepository, coordinator: coordinator
        )

        let viewController = RecipeBookListViewController(
            viewModel: viewModel
        )

        navigationController.setViewControllers([viewController], animated: false)
    }
}
