// Created by Gayan Dias on 11/09/2022.

import Combine
import PromiseKit
import SwiftUI

class RecipeBookListViewModel: ObservableObject {
    @Published private(set) var isLoading = false
    @Published var alertMessage: AlertMessage?
    @Published private(set) var recipes: [Recipe] = []
    @Published private(set) var recipeDetails: [RecipeDetail] = []

    private let coordinator: RecipeBookCordinator
    private let recipeBookRepository: RecipeBookRepository

    init(recipeBookRepository: RecipeBookRepository, coordinator: RecipeBookCordinator) {
        self.recipeBookRepository = recipeBookRepository
        self.coordinator = coordinator
    }

    func onAppear() {
        if recipeDetails.isEmpty {
            fetchRecipesByIngredients()
        }
    }
    
    @objc
    func closeButtonAction() {
        // TO DO
    }
    
    @objc
    func notificationButtonAction() {
        // TO DO
    }

    private func fetchRecipesByIngredients() {
        isLoading = true

        firstly {
            recipeBookRepository.getRecipeResponse()
        }.done { [self] recipe in
            self.recipes = recipe
        }.ensure { [self] in
            isLoading = true
            let recipeIds = (self.recipes.map{$0.id ?? 0}).map{String($0)}.joined(separator: ",")
            fetchBulkRecipeDetails(ids: recipeIds)
        }.catch { [self] error in
            alertMessage = AlertMessage(error: error)
        }
    }
    
    private func fetchBulkRecipeDetails(ids: String) {
        firstly {
            recipeBookRepository.getRecipeInformationResponse(ids: ids)
        }.done { [self] recipeDetails in
            self.recipeDetails = recipeDetails
        }.ensure { [self] in
            isLoading = false
        }.catch { [self] error in
            alertMessage = AlertMessage(error: error)
        }
    }

    func showDeils(recipe: RecipeDetail?) {
        if let recipe = recipe {
            coordinator.showDetail(recipe: recipe)
        }
    }
}
