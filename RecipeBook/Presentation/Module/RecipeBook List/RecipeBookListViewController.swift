// Created by Gayan Dias on 11/09/2022.

import SwiftUI
import UIKit

final class RecipeBookListViewController: UIHostingController<RecipeBookListView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private let viewModel: RecipeBookListViewModel

    init(viewModel: RecipeBookListViewModel) {
        self.viewModel = viewModel
        super.init(rootView: RecipeBookListView(viewModel: viewModel))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let notificationButton = UIBarButtonItem(
            image: .Images.notifications,
            style: .plain,
            target: viewModel,
            action: #selector(viewModel.closeButtonAction)
        )
        navigationItem.setRightBarButton(notificationButton, animated: false)
        
        let menuButton = UIBarButtonItem(
            image: .Images.menu,
            style: .plain,
            target: viewModel,
            action: #selector(viewModel.notificationButtonAction)
        )
        navigationItem.setLeftBarButton(menuButton, animated: false)
    }
}
