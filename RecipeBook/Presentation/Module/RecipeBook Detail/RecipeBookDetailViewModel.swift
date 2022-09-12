//// Created by Gayan Dias on 13/08/2022.

import Combine
import PromiseKit
import SwiftUI

class RecipeBookDetailViewModel: ObservableObject {
    @Published var recipe: RecipeDetail?

    init(recipe: RecipeDetail) {
        self.recipe = recipe
    }
    
    @objc
    func favouriteButtonAction() {
        // TO DO
    }
}
