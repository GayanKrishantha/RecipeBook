// Created by Gayan Dias on 12/09/2022.

import XCTest
@testable import RecipeBook

class RecipeBookTests: XCTestCase {
    override func setUpWithError() throws {}

    override func tearDownWithError() throws {}
    
    func test_RecipeDetailViewModel_isNill() {
        // given
        let recipe = testData()
        
        //when
        let vm = RecipeBookDetailViewModel(recipe: recipe)
        
        //then
        XCTAssertTrue((vm.recipe != nil))
        
    }
    
    func test_RecipeDetailViewModel_isNotNill() {
        // given
        let recipeNil: RecipeDetail? = nil
        
        //when
        let recipe = testData()
        
        //then
        XCTAssertNotNil(recipeNil ?? recipe)
    }
    
    // TO DO
}


extension RecipeBookTests {
    func testData() -> RecipeDetail {
        let recipe = RecipeDetail(id: 23456,
                                  title: "Japalac Cocktail",
                                  readyInMinutes: 45,
                                  servings: 1,
                                  image: URL(string: "https://spoonacular.com//648452-556x370.jpg"),
                                  imageType: "jpg",
                                  summary: "The recipe Japalac Cocktail can be made <b>in about about 45 minutes</b>.",
                                  dishTypes: ["beverage",
                                              "drink"],
                                  instructions: "Add all ingredients to a mixing glass.",
                                  analyzedInstructions: [AnalyzedInstructions(name: "jh", steps: [ProducingSteps(number: 56765, step: "Tesyuyh")])],
                                  sourceName: "Foodista",
                                  vegetarian: true,
                                  vegan: true,
                                  glutenFree: true,
                                  veryHealthy: true,
                                  dairyFree: true,
                                  cheap: true,
                                  veryPopular: true,
                                  sustainable: true,
                                  lowFodmap: true,
                                  license: "CC BY 3.0",
                                  pricePerServing: 44.46,
                                  aggregateLikes: 5,
                                  extendedIngredients: [Ingredients(id: 45654, aisle: "Alcoholic Beverages", image: "beer.jpg", consistency: "LIQUID", nameClean: "rye beer", originalName: "3/4 ounce Rittenhouse Rye", amount: 0.75)])
        return recipe
    }
}
