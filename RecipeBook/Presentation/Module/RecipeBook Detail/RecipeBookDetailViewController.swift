// Created by Gayan Dias on 13/08/2022.

import SwiftUI
import UIKit

final class RecipeBookDetailViewController: UIHostingController<RecipeBookDetailView> {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .darkContent
    }
    
    private let viewModel: RecipeBookDetailViewModel

    init(viewModel: RecipeBookDetailViewModel) {
        self.viewModel = viewModel
        super.init(rootView: RecipeBookDetailView(viewModel: viewModel))
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hidesBarsOnTap = true
        title = viewModel.recipe?.title ?? L10n.Label.notAvailable
        
        let favouriteButton = UIBarButtonItem(
            image: .Images.like,
            style: .plain,
            target: viewModel,
            action: #selector(viewModel.favouriteButtonAction)
        )
        navigationItem.setRightBarButton(favouriteButton, animated: false)
    }
}
