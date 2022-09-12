// Created by Gayan Dias on 10/09/2022.

import Foundation

struct RecipeDetail: Decodable {
    let id: Int
    let title: String?
    let readyInMinutes: Int?
    let servings: Int?
    let image: URL?
    let imageType: String?
    let summary: String?
    let dishTypes: [String]?
    let instructions: String?
    let analyzedInstructions: [AnalyzedInstructions]?
    let sourceName: String?
    let vegetarian: Bool?
    let vegan: Bool?
    let glutenFree: Bool?
    let veryHealthy: Bool?
    let dairyFree: Bool?
    let cheap: Bool?
    let veryPopular: Bool?
    let sustainable: Bool?
    let lowFodmap: Bool?
    let license: String?
    let pricePerServing: Double?
    let aggregateLikes: Int?
    let extendedIngredients: [Ingredients]?
}

struct Ingredients: Codable {
    let id: Int?
    let aisle: String?
    let image: String?
    let consistency: String?
    let nameClean: String?
    let originalName: String?
    let amount: Double?
}

struct AnalyzedInstructions: Codable {
    let name: String?
    let steps: [ProducingSteps]?
}

struct ProducingSteps: Codable {
    let number: Int?
    let step: String?
}
