// Created by Gayan Dias on 11/09/2022.

import Foundation
import PromiseKit
import SafariServices
import UIKit

protocol RecipeBookCordinator: AnyObject {
    func showDetail(recipe: RecipeDetail)
}

final class RecipeBookCordinatorImpl: RecipeBookCordinator {
    private unowned let navigationController: AppNavigationController

    init(navigationController: AppNavigationController) {
        self.navigationController = navigationController
    }

    func showDetail(recipe: RecipeDetail) {
        let viewModel = RecipeBookDetailViewModel(recipe: recipe)
        let viewController = RecipeBookDetailViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
}
