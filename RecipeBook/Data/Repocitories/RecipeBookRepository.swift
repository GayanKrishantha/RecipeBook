// Created by Gayan Dias on 10/09/2022.

import Foundation
import Alamofire
import PromiseKit
import Combine

protocol RecipeBookRepository: AnyObject {
    func getRecipeResponse() -> Promise<[Recipe]>
    func getRecipeInformationResponse(ids: String) -> Promise<[RecipeDetail]>
}

final class RecipeBookRepositoryImpl: RecipeBookRepository {
    private let publicNetwork: Network

    init(publicNetwork: Network) {
        self.publicNetwork = publicNetwork
    }

    func getRecipeResponse() -> Promise<[Recipe]> {
        let params: [String: Any] = [
            "apiKey": valueForAPIKey("API_KEY"),
            "ingredients": valueForAPIKey("MAIN_INGREDIENT"),
            "number": "\(20)"
        ]
        return firstly { () -> Promise<[Recipe]> in
            publicNetwork.request(
                Route(.get, .recipes(.recipeFindByIngredients), with: params)
            )
        }
    }
    
    func getRecipeInformationResponse(ids: String) -> Promise<[RecipeDetail]> {
        let params: [String: Any] = [
            "apiKey": valueForAPIKey("API_KEY"),
            "ids": "\(ids)"
        ]
        return firstly { () -> Promise<[RecipeDetail]> in
            publicNetwork.request(
                Route(.get, .recipes(.recipeInformationBulk), with: params)
            )
        }
    }
}
