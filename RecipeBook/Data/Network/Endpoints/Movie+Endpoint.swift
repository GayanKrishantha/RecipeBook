// Created by Gayan Dias on 10/09/2022.

import Foundation

extension Endpoint {
    static func recipes(_ recipes: Recipes) -> Endpoint {
        .recipeBookApp(path: recipes.path)
    }

    enum Recipes {
        case recipeFindByIngredients
        case recipeInformationBulk

        var path: String {
            switch self {
            case .recipeFindByIngredients:
                return "/recipes/findByIngredients/"
            case .recipeInformationBulk:
                return "/recipes/informationBulk/"
            }
        }
    }
}
